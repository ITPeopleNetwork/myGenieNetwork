import React from "react";
import "../App.css";
const View = props => {
  return (
    <div className="form-wrapper">
      <form onSubmit={props.confirm}>
        <h1>Confirm Details</h1>
        <div className="firstname">
          <label htmlFor="firstname">First Name</label>

          <p>{props.signinFirstName}</p>
        </div>

        <div className="lastname">
          <label htmlFor="lastname">Last Name</label>
          <p>{props.signinLastName}</p>
        </div>
        <div className="emailaddress">
          <label htmlFor="emailaddress">Email Address</label>
          <p>{props.signinEmailAddress}</p>
        </div>
        <div className="preferredusername">
          <label htmlFor="preferredusername">User Name</label>
          <p>{props.signinUserName}</p>
        </div>
        {/* <div className="password">
              <label htmlFor="password">Password</label>
              <p>{props.signinPassword}</p>
            </div>
            <div className="confirmpassword">
              <label htmlFor="confirmpassword">Confirm Password</label>
            
            <p>{props.signinConfirmPassword}</p>
            </div> */}
        <div className="createaccount">
          <button type="button" onClick={props.confirm}>
            Confirm
          </button>
        </div>
      </form>
      <p className="createaccount">
        <button type="button" onClick={props.back}>
          Edit Details
        </button>
      </p>
    </div>
  );
};

export default View;
