import React from "react";
const UserLogin = props => {
  return (
    <div className="wrapper">
      <div className="form-wrapper">
        <form className="form">
          <h1>Login</h1>

          <div className="member_emailaddress">
            <label htmlFor="member_emailaddress">LogIn ID</label>
            <input
              id="userName"
              type="text"
              name="member_emailaddress"
              placeholder="enter you username or email"
              onChange={props.loginUserName}
            />
          </div>
          <br />
          <div className="member_password">
            <label htmlFor="member_password">Password</label>
            <input
              id="password"
              type="password"
              name="member_password"
              placeholder="enter your password"
              onChange={props.loginPassword}
            />
          </div>
          <div className="createaccount">
            <button type="button" onClick={props.click}>
              Log IN
            </button>
            <li>
              <a href="/ViewPage">Are you a new user?</a>
            </li>
          </div>
        </form>
      </div>
    </div>
  );
};

export default UserLogin;
