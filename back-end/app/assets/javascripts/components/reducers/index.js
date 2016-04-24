import { combineReducers } from 'redux';

// Reducers
import snippetsReducer from './snippets-reducer';
// import widgetReducer from './widget-reducer';
// import searchLayoutReducer from './search-layout-reducer';

// Combine Reducers
var reducers = combineReducers({
    snippetsReducer
});

export default reducers;
