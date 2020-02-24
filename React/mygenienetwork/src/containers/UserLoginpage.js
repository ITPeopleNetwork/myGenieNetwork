import React, { Component } from "react";
import UserLogin from "../components/login/UserLogin";
import axios from "axios";
class LoginPage extends Component {
  state = {
    UserName: "",
    Password: "",
    Message: ""
  };
  postDataHandler = () => {
    const data = {
      member_emailaddress: this.state.UserName,
      member_password: this.state.Password,
      member_preferredusername: this.state.UserName
    };
    console.log(data);
    axios.post("https://localhost:44329/api/Login", data).then(response => {
      console.log(response);
      this.setState({ Message: response.data.Message });
      alert(this.state.Message);
    });
  };
  render() {
    return (
      <div className="Login">
        <UserLogin
          click={() => this.postDataHandler()}
          loginUserName={event =>
            this.setState({ UserName: event.target.value })
          }
          loginPassword={event =>
            this.setState({ Password: event.target.value })
          }
        />

        {this.state.Message}
      </div>
    );
  }
}

export default LoginPage;
