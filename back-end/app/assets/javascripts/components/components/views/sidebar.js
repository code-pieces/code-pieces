import React from 'react';
import { Link } from 'react-router';

// Using "Stateless Functional Components"
//

import SidebarContext from './sidebar-context';
import SidebarList from './sidebar-list';

export default function(props) {
  return (
    <div className="sidebar-container">
      <SidebarContext/>
      <SidebarList/>
    </div>

    );
}
