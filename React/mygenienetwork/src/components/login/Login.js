import React from 'react';  
// import * as EmailValidator from 'email-validator';
// import { Formik, FormikProps, Form, Field } from 'formik';


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
            <input type="text" placeholder="confirmpassword"  name = "confirmPassword" onChange={props.handleChange('confirmPassword')} defaultValue={props.values.confirmPassword}/>
            <small>{props.formErr.confirmPassword}</small>
            </div>
            <div className="createaccount">
            <button type="button" onClick={props.click} disabled={props.isDisabled}>Sign In</button>
            <small>Already have an Account?</small>
            </div>
            </form>
            </div>
    )
};

{/* <Formik
    initialValues={{
      firstName: "",
      lastName: "",
      emailAddress: "",
      userName: "",
      password: "",
      confirmPassword: " "
    }}
  
    onSubmit={props.click}
   onChange={props.handleChange}
    validate={values => {
      let errors = {};
      if (!values.firstName) {
        errors.firstName = "required";
      } else if (values.firstName.length < 5) {
        errors.firstName = "firstname should be 5 character long";
      }
      if (!values.lastName) {
        errors.lastName = "required";
      } else if (values.lastName.length < 5) {
        errors.lastName = "firstname should be 5 character long";
      }
      if (!values.emailAddress) {
        errors.emailAddress = "required";
      } else if (!EmailValidator.validate(values.emailAddress)) {
        errors.emailAddress = "Invalid email address";
      }
      if (!values.userName) {
        errors.userName = "required";
      } else if (values.userName.length < 5) {
        errors.userName = "firstname should be 5 character long";
      }
      if (!values.password) {
        errors.password = "required";
      } else if (values.password.length < 5) {
        errors.password = "firstname should be 5 character long";
      }
      if (!values.confirmPassword) {
        errors.confirmPassword = "required";
      } else if (values.confirmPassword.length < 5) {
        errors.confirmPassword = "firstname should be 5 character long";
      }

      return errors;
    }}
  >
    
    {props => {
      const {
        values,
        touched,
        errors,
        isSubmitting,
        handleChange,
        handleBlur,
        handleSubmit
      } = props;
      return (
        <div className="wrapper">
          <div className="form-wrapper">
            <form
              onSubmit={handleSubmit}
              
              //onChange={handleChange}
              //</div></div> {props.click}
            >
              <h1>Signup for membership</h1>
              <div className="firstname">
                <label htmlFor="firstName">First Name</label>
                <input
                  type="text"
                  placeholder="firstname"
                  name="firstName"
                  onChange={handleChange}
                   value={values.firstName}

                  onBlur={handleBlur}
                  // onChange={props.handleChange1('firstName')}
                  //defaultValue={props.values.firstName}
                  className={errors.firstName && touched.firstName && "error"}
                />
                <pre>{JSON.stringify(values)}</pre>
                {errors.firstName && touched.firstName && (
                  <div>{errors.firstName}</div>
                )}
               
              </div>
              <div className="lastname">
                <label htmlFor="lastname">Last Name</label>
                <input
                  type="text"
                  placeholder="lastname"
                  name="lastName"
                   value={values.lastName}
                  onChange={handleChange("lastName")}
                  onBlur={handleBlur}
                 // defaultValue={props.values.lastName}
                  className={errors.lastName && touched.lastName && "error"}
                />
                {errors.lastName && touched.lastName && (
                  <div>{errors.lastName}</div>
                )}
            
              </div>
              <div className="emailaddress">
                <label htmlFor="emailAddress">Email Address</label>
                <input
                  type="text"
                  placeholder="emailAddress"
                  name="emailAddress"
                   value={values.emailAddress}
                  onChange={handleChange("emailAddress")}
                  onBlur={handleBlur}
                 // defaultValue={props.values.emailAddress}
                  className={
                    errors.emailAddress && touched.emailAddress && "error"
                  }
                />
                {errors.emailAddress && touched.emailAddress && (
                  <div>{errors.emailAddress}</div>
                )}
                
              </div>
              <div className="preferredusername">
                <label htmlFor="preferredusername">Username</label>
                <input
                  type="text"
                  placeholder="preferredusername"
                  name="userName"
                    value={values.userName}
                  onChange={handleChange("userName")}
                  onBlur={handleBlur}
                 // defaultValue={props.values.userName}
                  className={errors.userName && touched.userName && "error"}
                />
                {errors.userName && touched.userName && (
                  <div>{errors.userName}</div>
                )}
              
              </div>
              <div className="password">
                <label htmlFor="password">Password</label>
                <input
                  type="text"
                  placeholder="password"
                  name="password"
                   value={values.password}
                  onChange={handleChange("password")}
                  onBlur={handleBlur}
                //  defaultValue={props.values.password}
                  className={errors.password && touched.password && "error"}
                />
                {errors.password && touched.password && (
                  <div>{errors.password}</div>
                )}
               
              </div>
              <div className="confirmpassword">
                <label htmlFor="confirmpassword">Confirm Password</label>
                <input
                  type="text"
                  placeholder="confirmpassword"
                  name="confirmPassword"
                     value={values.confirmPassword}
                  onChange={handleChange("confirmPassword")}
                  onBlur={handleBlur}
                 // defaultValue={props.values.confirmPassword}
                  className={
                    errors.confirmPassword && touched.confirmPassword && "error"
                  }
                />
                {errors.password && touched.password && (
                  <div>{errors.password}</div>
                )}
               
              </div>
              <div className="createaccount">
                <button
                  type="submit"
                  onClick={props.click}
                  disabled={isSubmitting}
                >
                  Sign In
                </button>
                <small>Already have an Account?</small>
              </div>
            </form>
          </div>
        </div>
      );
    }}
  </Formik>
    ) */}
 // }

export default Login;