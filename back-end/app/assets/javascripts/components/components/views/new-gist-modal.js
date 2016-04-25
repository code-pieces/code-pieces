import React from 'react';
export default ({
  id
}) => {
  return (
    <div id={id} className="modal fade new-gist-modal">
      <div className="modal-dialog" role="document">
        <div className="modal-content">
          <div className="modal-header modal-title">
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            <h3 className="modal-title">New Snippet</h3>
          </div>
          <div className="modal-body">
            <div className="modal-gist-description">
              <textarea className="gist-description" id="exampleTextarea" rows="3" placeholder="Description"></textarea>
            </div>
            <div className="gist-files-container">
              <div className="gist-file">
                <div className="gist-file-header">
                  <div className="gist-file-name">
                    <input className="gist-file-name-box" placeholder="Name"/>
                  </div>
                  <div className="gist-file-controls"></div>
                </div>
                <div className="gist-editor-container"></div>
              </div>
            </div>
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" className="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
  );
}
