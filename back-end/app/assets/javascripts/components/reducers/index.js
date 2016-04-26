import { combineReducers } from 'redux';

// Reducers
import snippetsReducer from './snippets-reducer';
import languagesReducer from './languages-reducer';
import userReducer from './user-reducer';

// Combine Reducers
var reducers = combineReducers({
    snippets: snippetsReducer,
    user: userReducer,
    languages: languagesReducer
});

export default reducers;
