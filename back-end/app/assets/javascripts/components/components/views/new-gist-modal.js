import React from 'react';
import AceEditor from 'react-ace';
import brace from 'brace';
import 'brace/mode/javascript';
import 'brace/mode/ruby';
import 'brace/theme/github';

import * as snippetsApi from '../../api/snippets-api';
var Select = require('react-select');

class NewGistModal extends React.Component {
  constructor(props) {
    super(props);

    this.handleChangeLanguage = this.handleChangeLanguage.bind(this);
    this.handleChangeSnippet = this.handleChangeSnippet.bind(this);
    this.handleClickSave = this.handleClickSave.bind(this);

    this.state = {
      language: 'javascript'
    }
  }

  handleChangeSnippet(newValue) {
    this.setState(this.state )
    console.log('change code', newValue);
  }

  handleChangeLanguage(newValue) {
    debugger
    this.setState({ language: newValue.value });
    console.log('change language', newValue);
  }

  handleClickSave() {
    this.
  }

  render() {
    let id = this.props.id;
    let options = [
      { value: 'javascript', label: 'Javascript' },
      { value: 'ruby', label: 'Ruby' }
    ];

    return (
      <div id={id} className="modal fade new-gist-modal">
        <div className="modal-dialog" role="document">
          <div className="modal-content">
            <div className="modal-header modal-title">
              <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
              </button>
              <h3 className="modal-title">New Snippet</h3>
            </div>
            <div className="modal-body">
              <div className="modal-gist-description">
                <textarea className="gist-description" id="exampleTextarea" rows="3" placeholder="Description" value={this.state.description}></textarea>
              </div>
              <div className="gist-files-container">
                <div className="gist-file">
                  <div className="gist-file-header">
                    <div className="gist-file-name">
                      <input className="gist-file-name-box" placeholder="Name" value={this.state.name} style={{float:'left', marginRight: '8px'}}/>
                      <Select name="select-language"
                        value={this.state.language}
                        options={options}
                        onChange={this.handleChangeLanguage}
                        className="gist-file-language-chooser" />
                    </div>
                    <div className="gist-file-controls"></div>
                  </div>
                  <div className="gist-editor-container">
                    <AceEditor mode={this.state.language}
                      theme="github"
                      onChange={this.handleChangeSnippet}
                      name={id + 'ace'}
                      width={'100%'} value={this.state.contents}/>
                  </div>
                </div>
              </div>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" className="btn btn-primary" onClick={this.handleClickSave}>Save changes</button>
            </div>
          </div>
        </div>
      </div>
    );
  }

}

export default NewGistModal;
