import React, { Component } from 'react';
import Login from "../components/login/Login";
import axios from 'axios';
import './Login.css';

class LoginPage extends Component {
  state = {
    UserName: '',
    Password: '',
    Message:'',
    step: 1
}

nextStep = () => {
  const { step } = this.state;
  this.setState({
      step: step + 1
  });
}


// postDataHandler = () => {
 
 
//   const data = {
//     UserName: this.state.UserName,
//     Password: this.state.Password,
//   };
//   console.log(data);
//   axios.post('https://localhost:44383/api/SignUp', data)
//       .then(response => {
//           console.log(response);
//           this.setState({Message:response.data.Message});
//          //const MessageR=response.data.message;

//       });
     
// }




  render() {
    
    return (
      <div className="Login">
        <Login
         click={()=>this.continue}
         loginUserName={(event) => this.setState({UserName: event.target.value})}
         loginPassword={(event) => this.setState({Password: event.target.value})}
         />
         {/* <View 
         nextStep={this.nextStep}
         
         /> */}
          {this.state.Message}
       </div>
      
       );
    
  }
}

export default LoginPage;