import React from 'react';

class Calculator extends React.Component {
  constructor() {
    super();
    this.state = {
      a: 0,
      b: 0,
      result: ''
    }
    this.handleChange = this.handleChange.bind(this);
    this.add = this.add.bind(this);
  }
  add(e) {
    this.setState({result: parseInt(this.state.a) + parseInt(this.state.b)})
  }
  handleChange(e) {
    var name = e.target.name;
    var newState = {};
    newState[name] = e.target.value;

    this.setState(newState);
  }
  render() {
    return(
      <div>
        a: <input name="a" value={this.state.a} onChange={this.handleChange} /><br/>
        b: <input name="b" value={this.state.b} onChange={this.handleChange} /><br/>
        <strong>{this.state.result}</strong><br/>
        <button onClick={this.add}>Add</button>
      </div>
    );
  }
}

export default Calculator;
