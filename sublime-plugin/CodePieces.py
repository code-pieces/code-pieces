import sublime, sublime_plugin
import os, os.path, shutil, urllib, errno, json, logging, re
import xml.etree.ElementTree as ET

class Client:
  def __init__(self):
    self.api_key = Persistent.read_file(['api_key']) if Persistent.file_exists(['api_key']) else ''

  def set_api_key(self, new_api_key):
    self.api_key = new_api_key
    Persistent.write_file(['api_key'], self.api_key)

  def get_snippets(self):
    res = urllib.request.urlopen('http://0.0.0.0:3000/api/snippets?for=sublime&api_key=' + self.api_key)
    body_json = json.loads(res.readall().decode())
    snippets = []

    for snippet_raw in body_json:
      snippet = Snippet(snippet_raw)
      snippets.append(snippet)

    return snippets

client = Client();

class Persistent:
  @staticmethod
  def mkdir_p(path):
    try:
      os.makedirs(path)
    except OSError as exc:
      if exc.errno == errno.EEXIST and os.path.isdir(path):
        pass
      else:
        raise

  @staticmethod
  def path(*path):
    return os.path.join(sublime.packages_path(), '.codepieces', *path)

  @staticmethod
  def write_file(path_parts, contents):
    dirpath_parts = path_parts[0:len(path_parts) - 1]
    Persistent.mkdir_p(Persistent.path(*dirpath_parts))
    f = open(Persistent.path(*path_parts), 'w')
    f.write(contents)

  @staticmethod
  def read_file(path_parts):
    f = open(Persistent.path(*path_parts), 'r')
    return f.read()

  @staticmethod
  def file_exists(path_parts):
    return os.path.exists(Persistent.path(*path_parts));

  @staticmethod
  def clear_snippets():
    if Persistent.file_exists(['sublime-snippets']):
      shutil.rmtree(Persistent.path('sublime-snippets'))

class Snippet:
  def __init__(self, raw_data):
    self.id = raw_data['id']
    self.name = raw_data['name']
    self.contents = raw_data['contents']

  def save(self):
    Persistent.write_file(['sublime-snippets', str(self.id) + '.sublime-snippet'], self.contents)

class CodePiecesResyncSnippetsCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    if client.api_key == '':
      sublime.error_message('API key is invalid.\nPlease set/reset API key first.')
      return

    self.view.set_status('codepieces::sync', 'Syncing your snippets...')
    Persistent.clear_snippets()
    sublime.set_timeout_async(self.get_snippets, 0)

  def get_snippets(self):
    snippets = client.get_snippets()

    for snippet in snippets:
      snippet.save()

    self.view.erase_status('codepieces::sync'),

class CodePiecesBrowseSnippetsCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    if not Persistent.file_exists(['sublime-snippets']):
      return

    menu_items = []

    for f in os.listdir(Persistent.path('sublime-snippets')):
      ptt = re.compile('\.sublime-snippet$')

      if re.search('\.sublime-snippet$', f):
        menu_items.append(self.menu_item(Persistent.path('sublime-snippets', f)))

    self.view.window().show_quick_panel(
      menu_items,
      lambda idx:
        self.view.run_command('insert_snippet', {
          'contents': menu_items[idx][1]
        })
    )

  def menu_item(self, filepath):
    root = ET.parse(filepath).getroot()
    name = ''
    description = ''
    for child in root:
      if child.tag == 'name':
        name = child.text
      if child.tag == 'content':
        description = child.text

    return [name, description]

class CodePiecesClearSnippetsCommand(sublime_plugin.WindowCommand):
  def run(self):
    Persistent.clear_snippets()

class CodePiecesChangeApiKeyCommand(sublime_plugin.WindowCommand):
  def run(self):
    self.window.show_input_panel(
      'API Key',
        client.api_key,
      lambda api_key:
        client.set_api_key(api_key),
      lambda *args: None,
      lambda *args: None
    )
