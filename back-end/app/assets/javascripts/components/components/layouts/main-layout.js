import React from 'react';
import { Link } from 'react-router';

// Using "Stateless Functional Components"
//
import HeaderContainer from '../containers/header-container';
import Sidebar from '../views/sidebar';
import Content from '../views/content';

export default function(props) {
  return (
    <div className="developer-layout">
      <HeaderContainer/>
      <div className="main-view-container">
        <Sidebar/>
        <Content/>
      </div>
    </div>

    );
}
