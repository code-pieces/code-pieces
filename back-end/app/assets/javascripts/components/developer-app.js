import { Component } from 'react';
import { Provider } from 'react-redux';
import store from './store';
import router from './router';

import { storeApiKey } from './actions/user-actions';

// debugger
export default class DeveloperApp extends Component {
  constructor(props) {
    super(props);

    store.dispatch(storeApiKey(props.apiKey));
  }

  render() {
    return (
      <Provider store={store}>
        {router}
      </Provider>
    );
  }
}
