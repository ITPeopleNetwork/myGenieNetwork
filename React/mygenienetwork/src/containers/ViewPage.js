import React, { Component } from 'react';

import Login from "../components/login/Login";
import View from "../components/View";
import axios from 'axios';
import './ViewPage.css';
import AdditionalDetails from './AdditionalDetails';
const emailRegex = RegExp(/^[a-zA-Z0-9]+@(?:[a-zA-Z0-9]+\.)+[A-Za-z]+$/);
let enabled = {};
class ViewPage extends Component {
    state = {
        firstName: '' ,
        lastName: '' ,
        emailAddress: '' ,
        userName : '' ,
        password : '',
        confirmPassword:'',
        formErrors: {
            firstName: "",
            lastName: "",
           emailAddress: "",
            userName: "",
            password: "",
            confirmPassword: "",
    
          },

      Message:'',
      step: 1,
      isDisabled:true,
     // enabled : false

  }
    nextStep = () => {
       // console.log("ramram")
        const { step } = this.state;
        this.setState({
            step: step + 1
        });
    }

    prevStep = () => {
        const { step } = this.state;
        this.setState({
            step: step - 1
        });
    }
    handleChange = input => e => {
       
         this.setState({ [input]: e.target.value });
         const { name, value } = e.target;
         let formErrors = this.state.formErrors;
         console.log(this.state.formErrors)
        
        
         switch (name) {
            case "firstName":
              if( (formErrors.firstName = value.length < 3 )  )
              {
                
                this.setState({isDisabled:true});
                enabled["firstName"] = false;
               // console.log(this.state.isDisabled);
                formErrors.firstName="minimum 4 character required"
              }
              else{
                enabled["firstName"] = true;
              }
             
              break;
              case "lastName":
                if((formErrors.lastName = value.length < 3)  )
                {
                  enabled["lastName"] = false;
                  this.setState({isDisabled:true});
               //   console.log(this.state.isDisabled)
                  formErrors.lastName="minimum 4 character required"
                } 
                else{
                  enabled["lastName"] = true;
                }
                         
                break;
              
              case "userName":
                if(formErrors.userName = value.length < 5)
                {
                  enabled["userName"] = false;
                  this.setState({isDisabled:true});
                //  console.log(this.state.isDisabled)
                  formErrors.userName="minimum 6 character required"
                }
                else{
                  enabled["userName"] = true;
                }
               
                break;
              case "password":
                if(formErrors.password = value.length < 5)
                {
                  enabled["password"] = false;
                  enabled["confirm"] = this.state.password;
                  console.log(enabled["confirm"])
                  this.setState({isDisabled:true});
              //    console.log(this.state.isDisabled)
                  formErrors.password="minimum 5 character required"
                }  
                else{
                  enabled["password"] = true;
                }
               
                
                break;
              case "confirmPassword":
                
                if(formErrors.confirmPassword = value.length < 5 )
                {
                  enabled["confirmPassword"] = false;
                  this.setState({isDisabled:true});
                //  console.log(this.state.isDisabled)
                 // formErrors.confirmPassword="password not matched"
                }
                else
               
                {
                  enabled["confirmPassword"] = true;
                //  formErrors.confirmPassword="password matched"
                }
               
               
               
                break;
                case "emailAddress":
                if(emailRegex.test(value))
                {
                  enabled["emailAddress"] = true;
                    }  
                    
                    else{
                      enabled["emailAddress"] = false;
                      this.setState({isDisabled:true})
                      formErrors.emailAddress = "Invalid email address"
                    }
                            
                   
                break;
              default:
                break;
            }
           console.log(enabled["firstName"])
           console.log(enabled["lastName"])
           console.log(enabled["emailAddress"])
           console.log(enabled["userName"])
           console.log(enabled["password"])
           console.log(enabled["confirmPassword"])
            if(enabled["firstName"] && enabled["lastName"] && enabled["emailAddress"] 
            && enabled["userName"] && enabled["password"] && enabled["confirmPassword"] )
            {
              this.setState({isDisabled:false});
            }
           
           
          // enabled = (formErrors[firstName].length > 2) && (formErrors[lastName].length > 2)
          //   && (formErrors[emailAddress].length > 4) && (formErrors[password].length> 4) 
          //   && (formErrors[confirmPassword].length > 4) 
           //console.log(enabled)
          //   console.log(formErrors[confirmPassword].length)
          //  if(enabled ){
          //     this.setState({isDisabled:false});
              this.setState({ formErrors, [name]: value }, () => console.log(this.state));
           //}

           

           
           // console.log(this.state.isDisabled);
          //  console.log(this.state.firstName.length)
          };
    
    postDataHandler = () => {
 
 
          const data = {
            member_firstname: this.state.firstName,
            member_lastname: this.state.lastName,
            member_emailaddress: this.state.emailAddress,
            member_preferredusername: this.state.userName,
            //member_password: this.state.password,
            member_confirmpassword: this.state.confirmPassword,
          };
          console.log(data);
          axios.post('https://localhost:44383/api/memberSignup', data)
              .then(response => {
                  console.log(response.data);
                  this.setState({Message:response.data.Message})
              })
              this.nextStep();
            }
            
    render() {
      
       
        const { step } = this.state;
        const { firstName, lastName, emailAddress, userName, 
            password, confirmPassword } = this.state;
            const values = { firstName, lastName, emailAddress,
                userName, password, confirmPassword };

        switch (step) {
            case 1:
                return (
                    
                    <div className="wrapper">
                        
                    <Login
                    
                    // firstName={(event) => this.setState({firstName: event.target.value})}
                    // lastName={(event) => this.setState({lastName: event.target.value})}
                    // emailAddress={(event) => this.setState({emailAddress: event.target.value})}
                    // userName={(event) => this.setState({userName: event.target.value})}
                    // password={(event) => this.setState({password: event.target.value})}
                    // confirmPassword={(event) => this.setState({confirmPassword: event.target.value})}
                    handleChange={this.handleChange}
                    formErr={this.state.formErrors}
                    values={values}
                     click={this.nextStep}
                     isDisabled={this.state.isDisabled}
                     />
                     </div>
                )
            case 2:
                return (
                    <div className="wrapper">
                    <View
                       signinFirstName={this.state.firstName} 
                       signinLastName={this.state.lastName}
                       signinEmailAddress={this.state.emailAddress}
                       signinUserName={this.state.userName}
                       signinPassword={this.state.password}
                      signinConfirmPassword={this.state.confirmPassword}
                       confirm={this.postDataHandler}
                       handleChange={this.handleChange}
                       back={this.prevStep}
                    />
                    </div>
                )
            case 3:
                return (<div>
                  <AdditionalDetails/>
                  </div>
                )
        }
    }
}
export default ViewPage;