import RWR from 'react-webpack-rails';
RWR.run();

import HelloWorld from './components/hello-world';
RWR.registerComponent('HelloWorld', HelloWorld);

import Calculator from './components/calculator';
RWR.registerComponent('Calculator', Calculator);
