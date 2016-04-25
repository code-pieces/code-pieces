import React from 'react';
import { Link } from 'react-router';

// Using "Stateless Functional Components"
//
import SplitViewList from './content-split-view-list';
import SplitViewContent from './content-split-view-content';

export default function(props) {
  return (
    <div className="content-container">
      <div className="split-view">
        <SplitViewList/>
        <SplitViewContent/>
      </div>
    </div>

    );
}
