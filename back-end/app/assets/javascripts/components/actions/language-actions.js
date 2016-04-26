import * as types from '../actions/action-types';

export function getLanguagesSent() {
  // debugger
  return {
    type: types.GET_LANGUAGES_SENT,
    isLoading: true
  };
}

export function getLanguagesSuccess(languages) {
  // debugger
  return {
    type: types.GET_LANGUAGES_SUCCESS,
    languages
  };
}
