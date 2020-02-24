import React, { Component } from "react";
import "./App.css";
import ViewPage from "./containers/ViewPage";
import { BrowserRouter, Route } from "react-router-dom";
import UserLoginpage from "./containers/UserLoginpage";
import Home from "./components/login/Home";
class App extends Component {
  state = {
    visible: true
  };
  render() {
    return (
      <BrowserRouter>
        <div className="App">
          <header className="blog">
            <nav>
              <ul>
                <li>
                  <a href="/" exact="true">
                    Home
                  </a>
                </li>
                <li>
                  <a href="/UserLoginpage">Login</a>
                </li>
                <li>
                  <a href="/ViewPage">Registration</a>
                </li>
              </ul>
            </nav>
          </header>
          <Route path="/" exact component={Home} />
          <Route path="/UserLoginpage" exact component={UserLoginpage} />
          <Route path="/ViewPage" exact component={ViewPage} />
          {/* <ValidationForm />
        <Login/>
        <Home/> */}
        </div>
      </BrowserRouter>
    );
  }
}
export default App;
