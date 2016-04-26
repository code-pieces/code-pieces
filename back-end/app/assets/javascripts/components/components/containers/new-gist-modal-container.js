import React from 'react';
import { connect } from 'react-redux';

import NewGistModal from '../views/new-gist-modal';

import * as snippetsApi from '../../api/snippets-api';

// class NewGistModalContainer extends React.Component {
//   componentDidMount() {
//     // debugger

//   }

//   render() {
//     return (
//       <NewGistModal id="myModal"  />
//     );
//   }
// }

// NewGistModalContainer.defaultProps = {
//   snippets: []
// }

// NewGistModalContainer.contextTypes = {
//   store: React.PropTypes.object
// };

const mapStateToProps = (state) => {
  // debugger
  return {
    languages: state.languages
  };
};

// const mapDispatchToProps = (dispatch) => {

// };

export default connect(mapStateToProps)(NewGistModal);
