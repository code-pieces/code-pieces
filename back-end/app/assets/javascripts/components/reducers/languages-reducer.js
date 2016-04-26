import * as types from '../actions/action-types';


const initialState = {
  languages: [],
  isLoading: false
};

const languagesReducer = function(state = initialState, action) {
  switch(action.type) {
    case types.GET_LANGUAGES_SENT:
      return {
        ...state,
        isLoading: true
      };
    case types.GET_LANGUAGES_SUCCESS:
      return {
        ...state,
        languages: action.languages,
        isLoading: false
      };

    default:
      return state;
  }
}

export default languagesReducer;
