import * as types from '../actions/action-types';

export function storeApiKey(apiKey) {
  console.log('action: STORE_API_KEY ' + apiKey );
  return {
    type: types.STORE_API_KEY,
    apiKey
  };
}

export function getUserSuccess(user) {
  return {
    type: types.GET_USER_SUCCESS,
    user
  };
}
