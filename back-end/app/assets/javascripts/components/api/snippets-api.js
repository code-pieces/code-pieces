import $ from 'jquery';
import store from '../store';
import { getSnippetsSuccess, deleteSnippetSuccess } from '../actions/snippet-actions';

/**
 * Get Snippets
 */

export function getSnippets(apiKey) {
  return $.get('/api/snippets?api_key=' + apiKey, (response) => {
    // debugger
    store.dispatch(getSnippetsSuccess(response));
    return response;
  });
}
