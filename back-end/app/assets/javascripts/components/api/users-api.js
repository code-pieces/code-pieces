import $ from 'jquery';
import store from '../store';
import { getUserSuccess } from '../actions/user-actions';

/**
 * Get Snippets
 */

export function getUser(apiKey) {
  return $.get('/api/user?api_key=' + apiKey, (response) => {
    // debugger
    store.dispatch(getUserSuccess(response));
    return response;
  });
}
