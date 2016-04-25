import React from 'react';
import { Link } from 'react-router';

import SplitGist from './split-gist';

export default function({
  snippets
}) {
  // debugger
  return (
    <div className="split-view-list-gists" style={{height: '600px'}}>
      {
        snippets.map (snippet => {
          return (
          <SplitGist key={snippet.id} {...snippet}/>
          );
        })

      }
    </div>
  );
}


