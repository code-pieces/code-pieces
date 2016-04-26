import React from 'react';
import { Link } from 'react-router';

export default ({
  name,
  description,
  created_at,
  user
}) => {
  // debugger
  return (
    <div className="split-gist" >
        <div className="split-gist-grapple">
        </div>
        <div className="split-gist-header">
          <img src={user.avatar_url}/>
          <div className="gist-meta">
            <div className="gist-name">
              {name}
            </div>
            <span className="gist-created-updated">
              {created_at}
            </span>
          </div>
          <div className="gist-flags">
          </div>
        </div>
        <div className="gist-description">
          {description}
        </div>
        <div className="gist-labels">
          <i className="fa fa-tags">
          </i>
          <span className="gist-no-labels">
            No Labels
          </span>
        </div>
      </div>
  );
}


