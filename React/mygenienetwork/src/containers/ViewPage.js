import React, { Component } from "react";
import Login from "../components/login/Login";
import View from "../components/View";
import axios from "axios";
import "./ViewPage.css";

class ViewPage extends Component {
  state = {
    firstName: "",
    lastName: "",
    emailAddress: "",
    userName: "",
    password: "",
    confirmPassword: "",

    Message: "",
    step: 1
  };
  nextStep = () => {
    // console.log("ramram")
    const { step } = this.state;
    this.setState({
      step: step + 1
    });
  };

  prevStep = () => {
    const { step } = this.state;
    this.setState({
      step: step - 1
    });
  };
  // handleChange = input => e => {
  //     this.setState({ [input]: e.target.value });
  // }
  postDataHandler = () => {
    const data = {
      member_firstname: this.state.firstName,
      member_lastname: this.state.lastName,
      member_emailaddress: this.state.emailAddress,
      member_preferredusername: this.state.userName,
      member_password: this.state.password,
      member_confirmpassword: this.state.confirmPassword
    };
    console.log(data);
    axios.post("https://localhost:44329/api/Employees", data).then(response => {
      console.log(response.data);
      this.setState({ Message: response.data.Message });
    });
  };

  render() {
    const { step } = this.state;
    const {
      firstName,
      lastName,
      emailAddress,
      userName,
      password,
      confirmPassword
    } = this.state;
    const values = {
      firstName,
      lastName,
      emailAddress,
      userName,
      password,
      confirmPassword
    };
    
    switch (step) {
      case 1:
        return (
          <div className="wrapper">
            <Login
              firstName={event =>
                this.setState({ firstName: event.target.value })
              }
              lastName={event =>
                this.setState({ lastName: event.target.value })
              }
              emailAddress={event =>
                this.setState({ emailAddress: event.target.value })
              }
              userName={event =>
                this.setState({ userName: event.target.value })
              }
              password={event =>
                this.setState({ password: event.target.value })
              }
              confirmPassword={event =>
                this.setState({ confirmPassword: event.target.value })
              }
              // handleChange={this.handleChange}
              values={values}
              click={this.nextStep}
            />
          </div>
        );
      case 2:
        return (
          <div className="wrapper">
            <View
              signinFirstName={this.state.firstName}
              signinLastName={this.state.lastName}
              signinEmailAddress={this.state.emailAddress}
              signinUserName={this.state.emailAddress}
              signinPassword={this.state.password}
              signinConfirmPassword={this.state.confirmPassword}
              confirm={this.postDataHandler}
              handleChange={this.handleChange}
              back={this.prevStep}
            />
          </div>
        );
      case 3:
        return <h1>Success</h1>;
      default:
        break;
    }
  }
}
export default ViewPage;
