import React from 'react';
import { Link } from 'react-router';

import FilterBar from './filter-bar';
import ListGistsContainer from '../containers/list-gists-container';

export default function(props) {
  // debugger
  return (
    <div className="split-view-list" >
      <FilterBar/>
      <div className="split-view-list-refresh-notice" style={{display: 'none'}}>
        Gists updated. Click to refresh.
        <i className="icon-refresh">
        </i>
      </div>
      <ListGistsContainer/>
    </div>

  );
}
