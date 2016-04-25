import React from 'react';
import { connect } from 'react-redux';

import Header from '../views/header';

import * as usersApi from '../../api/users-api';

class HeaderContainer extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount() {
    // debugger
    usersApi.getUser(this.props.apiKey);
  }

  render() {
    return (
      <Header name={this.props.name}/>
    );
  }
}

HeaderContainer.contextTypes = {
  store: React.PropTypes.object
};

const mapStateToProps = (state) => {
  // debugger
  return {
    ...state.user
  };
};

export default connect(mapStateToProps)(HeaderContainer);
