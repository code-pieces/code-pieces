import * as types from '../actions/action-types';


const initialState = {
  snippets: [],
  isLoading: false
};

const snippetsReducer = function(state = initialState, action) {
  switch(action.type) {
    case types.GET_SNIPPETS_SENT:
      return {
        ...state,
        isLoading: true
      };
    case types.GET_SNIPPETS_SUCCESS:
      return {
        ...state,
        snippets: action.snippets,
        isLoading: false
      };
    case types.CREATE_SNIPPET_SUCCESS:
      return {
        ...state,
        snippets: [
          ...state.snippets,
          action.snippet
        ]
      };

    default:
      return state;
  }
}

export default snippetsReducer;
