import { Component } from 'react';
import { Provider } from 'react-redux';
import store from './store';
import router from './router';
debugger
export default class DeveloperApp extends Component {
  render() {
    return (
      <Provider store={store}>
        {router}
      </Provider>
    );
  }
}
