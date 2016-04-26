import $ from 'jquery';
import store from '../store';
import { getLanguagesSuccess, getLanguagesSent } from '../actions/language-actions';

/**
 * Get Snippets
 */

export function getLanguages() {
  return (dispatch, getState) => {
    // debugger
    const { apiKey } = getState().user;

    dispatch(getLanguagesSent())
    $.get('/api/languages?api_key=' + apiKey).done(response => {
      dispatch(getLanguagesSuccess(response));
    });
  };
}
