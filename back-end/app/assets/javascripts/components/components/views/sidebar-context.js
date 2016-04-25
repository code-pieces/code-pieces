import React from 'react';
import { Link } from 'react-router';

export default function(props) {
  return (
    <div className="context-container">
        <div className="context-selector">
          <img src="https://avatars.githubusercontent.com/u/6060163?v=3"/>
          <span className="context-selector-name">
            Personal Library
          </span>
          <i className="fa fa-caret-down">
          </i>
          <span className="context-select-spinner" style={{display: 'none'}}>
          </span>
          <div className="context-selector-dropdown" style={{display: 'none'}}>
            <ul>
              <li className="context-selector-personal-library context-selector-item-selected">
                <img src="https://avatars.githubusercontent.com/u/6060163?v=3"/>
                <span>
                  Personal Library
                </span>

              </li>
              <li className="context-selector-start-new-group">
                <i className="icon-plus-sign-alt">
                </i>
                <span>
                  Start New Group
                </span>
              </li>
            </ul>
          </div>

        </div>
      </div>

    );
}
