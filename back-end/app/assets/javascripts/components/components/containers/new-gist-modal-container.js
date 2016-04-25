import React from 'react';
import { connect } from 'react-redux';

import NewGistModal from '../views/new-gist-modal';

import * as snippetsApi from '../../api/snippets-api';

class NewGistModalContainer extends React.Component {
  componentDidMount() {
    // debugger

  }

  render() {
    return (
      <NewGistModal  />
    );
  }
}

ListGistsContainer.defaultProps = {
  snippets: []
}

ListGistsContainer.contextTypes = {
  store: React.PropTypes.object
};

const mapStateToProps = (state) => {
  // debugger
  return {
    apiKey: state.user.apiKey
  };
};

// const mapDispatchToProps = (dispatch) => {

// };

export default connect(mapStateToProps)(NewGistModalContainer);
