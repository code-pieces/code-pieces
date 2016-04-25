import * as types from '../actions/action-types';


const initialState = [];

const snippetsReducer = function(state = initialState, action) {
  console.log('----------- SNIPPETS REDUCER --------------');
  console.log(action);

  // debugger
  switch(action.type) {
    case types.GET_SNIPPETS_SUCCESS:
      // debugger;
      return [...action.snippets];
    case types.CREATE_SNIPPET_SUCCESS:
      return [...state, action.snippet];

    default:
      return state;
  }
}

export default snippetsReducer;
