import React from 'react';
import AceEditor from 'react-ace';
import brace from 'brace';
import 'brace/mode/javascript';
import 'brace/mode/ruby';
import 'brace/theme/monokai';

import * as languagesApi from '../../api/languages-api';
import * as snippetsApi from '../../api/snippets-api';

var Select = require('react-select');

class NewGistModal extends React.Component {
  constructor(props) {
    super(props);

    this.handleChangeLanguage = this.handleChangeLanguage.bind(this);
    this.handleChangeSnippet = this.handleChangeSnippet.bind(this);
    this.handleChangeDescription = this.handleChangeDescription.bind(this);
    this.handleChangeName = this.handleChangeName.bind(this);

    this.handleClickSave = this.handleClickSave.bind(this);

    this.state = {
      description: '',
      contents: '',
      name: '',
      language_id: -1
    };

  }

  componentWillMount() {
    const { dispatch } = this.props;

    dispatch(languagesApi.getLanguages());
  }

  handleChangeSnippet(newValue) {
    // debugger
    // this.setState( {...this.state, contents: newValue} )
    this.state.contents = newValue;
    console.log('change code', newValue);
  }

  handleChangeLanguage(newValue) {
    // debugger
    this.setState({...this.state, language_id: newValue.value});
    // this.state.language_id = newValue.value;
    console.log('change language', newValue);
  }

  handleChangeDescription(e) {
    // debugger
    this.setState({...this.state, description: e.target.value});
    // this.state.description = e.target.value;
    // console.log('new description', newValue);
  }

  handleChangeName(e) {
    // debugger
    // this.state.name = e.target.value;
   this.setState({name: e.target.value});
   console.log(this.state);
  }

  handleClickSave() {
    // debugger
    const { dispatch } = this.props;

    dispatch(snippetsApi.createSnippet(this.state));
  }

  render() {
    const { id } = this.props;
    const { isLoading, languages } = this.props.languages;

    let options = languages.map(language => {
      return {
        label: language.name,
        value: language.id
      }
    });

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
                <textarea className="gist-description" id="exampleTextarea"
                rows="3"
                placeholder="Description"
                value={this.state.description}
                onChange={this.handleChangeDescription}></textarea>
              </div>
              <div className="gist-files-container">
                <div className="gist-file">
                  <div className="gist-file-header">
                    <div className="gist-file-name">
                      <input className="gist-file-name-box" placeholder="Name"
                         style={{float:'left', marginRight: '8px'}}
                         value={this.state.name}
                        onChange={this.handleChangeName}/>
                      <Select name="select-language"
                        value={this.state.language_id}
                        options={options}
                        onChange={this.handleChangeLanguage}
                        className="gist-file-language-chooser" />
                    </div>
                    <div className="gist-file-controls"></div>
                  </div>
                  <div className="gist-editor-container">
                    <AceEditor mode="javascript"
                      theme="github"
                      onChange={this.handleChangeSnippet}
                      name={id + 'ace'}
                      width={'100%'} />
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
