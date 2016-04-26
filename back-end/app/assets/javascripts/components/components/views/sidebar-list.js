import React from 'react';
import { Link } from 'react-router';

import NewGistModalContainer from '../containers/new-gist-modal-container';


export default function(props) {
  let modalId = 'myModal';
  return (
    <div>
    <ul className="sidebar">
        <li className="sidebar-new-gist tip-right">
          <button onClick={()=>{
            console.log('open dialgo');
            $('#myModal').modal('show');
          }}>
            <i className="fa fa-file-o"></i> New Gist
          </button>

        </li>
        <li className="sidebar-my-gists sidebar-selected" data-url="library/my-gists">
          <i className="fa fa-list">
          </i>
          My Gists
          <span className="sidebar-count">
            1
          </span>
        </li>
        <li className="sidebar-starred-gists" data-url="library/starred">
          <i className="fa fa-star">
          </i>
          Starred
          <span className="sidebar-count">
            0
          </span>
        </li>
        <li className="sidebar-spacer">
        </li>
        <li className="sidebar-labels-heading">
          <i className="fa fa-tags">
          </i>
          Labels
          <span className="new-label-container">
            <i className="fa fa-plus tip-top new-label" data-hasqtip="true" oldtitle="New Label">
            </i>
          </span>
        </li>
        <li className="sidebar-labels-container">
          <ul className="sidebar-labels ui-sortable">
            <li className="sidebar-label ui-droppable" data-label-id="1460472900525">
              <span className="sidebar-label-grapple">
              </span>
              <i className="fa fa-caret-square-o-down">
              </i>
              <span className="sidebar-label-name">
                Important
              </span>
              <span className="sidebar-count">
                0
              </span>
            </li>
          </ul>
        </li>

      </ul>
      <NewGistModalContainer id="myModal"/>
      </div>
    );
}
