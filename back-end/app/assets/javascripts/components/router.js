import React from 'react';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';

// Layouts
import MainLayout from './components/layouts/main-layout';
// import SearchLayoutContainer from './components/containers/search-layout-container';

// Pages
// import Home from './components/home';
// import UserListContainer from './components/containers/user-list-container';
// import UserProfileContainer from './components/containers/user-profile-container';
// import WidgetListContainer from './components/containers/widget-list-container';

export default (
  <Router history={hashHistory}>
    <Route path="/" component={MainLayout}>

    </Route>
  </Router>
);
