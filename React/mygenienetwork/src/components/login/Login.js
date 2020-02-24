import React from "react";
const Login = props => {
  return (
  
    <div className="form-wrapper">
      <form onSubmit={props.click}>
        <h1>Signup for membership</h1>
        <div className="firstname">
          <label htmlFor="firstname">First Name</label>
          <input
            type="text"
            placeholder="firstname"
            onChange={props.firstName}
            defaultValue={props.values.firstName}
          />
        </div>
        <div className="lastname">
          <label htmlFor="lastname">Last Name</label>
          <input
            type="text"
            placeholder="lastname"
            onChange={props.lastName}
            defaultValue={props.values.lastName}
          />
        </div>
        <div className="emailaddress">
          <label htmlFor="emailaddress">Email Address</label>
          <input
            type="text"
            placeholder="lastname"
            onChange={props.emailAddress}
            defaultValue={props.values.emailAddress}
          />
        </div>
        <div className="preferredusername">
          <label htmlFor="preferredusername">Username</label>
          <input
            type="text"
            placeholder="preferredusername"
            onChange={props.userName}
            defaultValue={props.values.userName}
          />
        </div>
        <div className="password">
          <label htmlFor="password">Password</label>
          <input
            type="text"
            placeholder="password"
            onChange={props.password}
            defaultValue={props.values.password}
          />
        </div>
        <div className="confirmpassword">
          <label htmlFor="confirmpassword">Confirm Password</label>
          <input
            type="text"
            placeholder="confirmpassword"
            onChange={props.confirmPassword}
            defaultValue={props.values.confirmPassword}
          />
        </div>
        <div className="createaccount">
          <button type="button" onClick={props.click}>
            Sign In
          </button>
          <li>
            <a href="/UserLoginpage">already you have an account</a>
          </li>
        </div>
      </form>
    </div>
    // </Formik>
  );
};

export default Login;
