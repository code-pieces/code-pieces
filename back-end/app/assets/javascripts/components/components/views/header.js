import React from 'react';
import { Link } from 'react-router';
// Using "Stateless Functional Components"
export default function ({
  name
}) {
  return (
    <header className="navbar navbar-fixed-top navbar-light bg-faded header-view-container">
      <a className="navbar-brand" href="#">
        Code Pieces
      </a>
      <div className="header-controls">
        <a href="#">
          <i className="material-icons">
          settings
          </i>
        </a>
        <a href="#">
          <i className="material-icons">
          help
          </i>
        </a>
        <a href="#">
          <i className="material-icons fa-rotate-90">
          autorenew
          </i>
        </a>
      </div>
      <div className="header-divider">
      </div>
      <div className="input-group header-searchbox">
        <input className="form-control" placeholder="Search for..." type="text"/>
        <span className="input-group-btn">
          <button className="btn btn-secondary" type="button">
          <i className="material-icons icon-search">
          search
          </i>
          </button>
        </span>
      </div>
      <div className="nav navbar-nav pull-right">
        <a className='nav-link sign-out' href='/auth/logout' data-method='delete'>Sign out</a>

      </div>
      <div className="header-nav">
        <div className="nav navbar-nav pull-right">
          <a className="nav-item nav-link " href="#">
            <i aria-hidden="true" className="fa fa-gratipay">
            </i>
            GitTip Us
            <span className="sr-only">
              (current)
            </span>
          </a>
          <a className="nav-item nav-link" href="#">
            <i aria-hidden="true" className="fa fa-scissors">
            </i>
            Clipper
          </a>
          <a className="nav-item nav-link header-gistbox-clipper">
          </a>
          <a className="nav-item nav-link" href="#">
            <i aria-hidden="true" className="fa fa-github">
            </i>&nbsp;
            {name}
          </a>
        </div>
      </div>
    </header>
  );
}
