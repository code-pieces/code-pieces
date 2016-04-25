import React from 'react';
import { Link } from 'react-router';

export default function(props) {
  return (
    <div className="split-view-filter-bar-container">
      <div className="filter-bar">
        <div className="btn-group" data-toggle="buttons-radio">
          <button className="filter-all btn btn-secondary btn-sm active" type="button">
          All
          </button>
          <button className="filter-public btn btn-secondary btn-sm " type="button">
          Public
          </button>
          <button className="filter-private btn btn-secondary btn-sm " type="button">
          Private
          </button>
        </div>
        <div className="filter-bar-sorter">
          <a className="filter-active filter-by-created" href="#">
            <i className="icon-arrow-down">
            </i>
            Created
          </a>
          <a className="filter-by-updated" href="#">
            Updated
          </a>
        </div>
      </div>
    </div>
  );
}
