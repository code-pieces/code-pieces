import $ from 'jquery';
import store from '../store';
import { getSnippetsSent, getSnippetsSuccess, createSnippetSent, createSnippetSuccess } from '../actions/snippet-actions';

/**
 * Get Snippets
 */

export function getSnippets() {
  return (dispatch, getState) => {
    // debugger
    const { apiKey } = getState().user;

    dispatch(getSnippetsSent())
    $.get('/api/snippets?api_key=' + apiKey).done(response => {
      dispatch(getSnippetsSuccess(response));
    });
  };
}

export function createSnippet(snippet) {
  return (dispatch, getState) => {
    const { apiKey } = getState().user;
    // debugger
    dispatch(createSnippetSent(snippet));
    $.post('/api/snippets?api_key=' + apiKey, {
      snippet: snippet
    }).done((response) => {
      // debugger
      dispatch(createSnippetSuccess(response));
    });
  }

}
