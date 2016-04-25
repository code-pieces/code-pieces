import * as types from '../actions/action-types';


const initialState = {
};

const userReducer = function(state = initialState, action) {
  console.log('----------- USER REDUCER --------------');
  console.log(action);
  switch(action.type) {
    case types.STORE_API_KEY:
      // debugger;
      return Object.assign({}, state, {apiKey: action.apiKey});

    case types.GET_USER_SUCCESS:
      // debugger;
      return Object.assign({}, state, action.user);
    default:
      return state;
  }
}

export default userReducer;
