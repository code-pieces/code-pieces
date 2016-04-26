import React from 'react';
import { connect } from 'react-redux';

import ListGists from '../views/list-gists';

import * as snippetsApi from '../../api/snippets-api';

class ListGistsContainer extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const {dispatch} = this.props
    dispatch(snippetsApi.getSnippets());
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
    snippets: state.snippets.snippets
  };
};

export default connect(mapStateToProps)(ListGistsContainer);
