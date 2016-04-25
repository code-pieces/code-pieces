import * as types from '../actions/action-types';

export function getSnippetsSuccess(snippets) {
  // debugger
  return {
    type: types.GET_SNIPPETS_SUCCESS,
    snippets
  };
}
