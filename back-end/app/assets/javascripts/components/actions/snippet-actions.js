import * as types from '../actions/action-types';

export function getSnippetsSent() {
  // debugger
  return {
    type: types.GET_SNIPPETS_SENT,
    isLoading: true
  };
}

export function getSnippetsSuccess(snippets) {
  // debugger
  return {
    type: types.GET_SNIPPETS_SUCCESS,
    snippets
  };
}

export function createSnippetSuccess(snippet) {
  return {
    type: types.CREATE_SNIPPET_SUCCESS,
    snippet
  };
}

export function createSnippetSent(snippet) {
  return {
    type: types.CREATE_SNIPPET_SENT,
    snippet
  };
}
