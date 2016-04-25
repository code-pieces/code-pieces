import React from 'react';
import { connect } from 'react-redux';

import ListGists from '../views/list-gists';

import * as snippetsApi from '../../api/snippets-api';

class ListGistsContainer extends React.Component {
  constructor(props) {
    super(props);
    // debugger
  }

  componentDidMount() {
    // debugger
    snippetsApi.getSnippets(this.props.apiKey);
  }

  render() {
    return (
      <ListGists snippets={this.props.snippets} />
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
    apiKey: state.user.apiKey,
    snippets: state.snippets
  };
};

export default connect(mapStateToProps)(ListGistsContainer);
