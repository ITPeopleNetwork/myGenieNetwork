import React from 'react';
const Login = (props) => {
    
    return (
        <div className="form-wrapper">
             <form onSubmit={props.click}>
            <h1>Signup for membership</h1>
            <div className="firstname">
              <label htmlFor="firstname">First Name</label>
            <input type="text" placeholder="firstname" name = "firstName" onChange={props.handleChange('firstName')}  defaultValue={props.values.firstName}/>
            <small>{props.formErr.firstName}</small>
            </div>
            <div className="lastname">
              <label htmlFor="lastname">Last Name</label>
            <input type="text" placeholder="lastname" name = "lastName" onChange={props.handleChange('lastName')} defaultValue={props.values.lastName}/>
            <small>{props.formErr.lastName}</small>
            </div>
            <div className="emailaddress">
              <label htmlFor="emailaddress">Email Address</label>
            <input type="text" placeholder="emailaddress" name = "emailAddress" onChange={props.handleChange('emailAddress')} defaultValue={props.values.emailAddress}/>
            <small>{props.formErr.emailAddress}</small>
            </div>
            <div className="preferredusername">
              <label htmlFor="preferredusername">Username</label>
            <input type="text" placeholder="preferredusername" name = "userName" onChange={props.handleChange('userName')} defaultValue={props.values.userName}/>
            <small>{props.formErr.userName}</small>
            </div>
            <div className="password">
              <label htmlFor="password">Password</label>
            <input type="text" placeholder="password" name = "password" onChange={props.handleChange('password')} defaultValue={props.values.password}/>
            <small>{props.formErr.password}</small>
            </div>
            <div className="confirmpassword">
              <label htmlFor="confirmpassword">Confirm Password</label>
            <input type="text" placeholder="confirmpassword"  name = "confirmPassword" onChange={props.handleChange('password')} defaultValue={props.values.confirmPassword}/>
            <small>{props.formErr.confirmPassword}</small>
            </div>
            <div className="createaccount">
            <button type="button" onClick={props.click}>Sign In</button>
            <small>Already have an Account?</small>
            </div>
            </form>
            </div>
    )
};

export default Login;
