import React from "react";
//import './todo.css';
import './AdditionalDetails.css'
const emailRegex = RegExp(/^[a-zA-Z0-9]+@(?:[a-zA-Z0-9]+\.)+[A-Za-z]+$/);


export default class AdditionalDetails extends React.Component {
  
  constructor(){
    super();
    this.state={
      Background: "",
      CurrentJobTitle:"",
      CompanyName: "",
      EducationalInstitute:"",
      EducationLevel: "",
      Location:"",
      AlterPhoneNumber :"",
      AlterEmail : "",
      formErrors: {
        // firstName: "",
        // lastName: "",
        AlterEmailError: "",
        // preferredUsername: "",
        // password: "",
        // confirmPassword: "",

      },


     
      

      
    }
    
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    
  }
  EducationLevelhandler = (event) => {
    this.setState({
      EducationLevel: event.target.value
    })
}

 

  
  

  handleChange = event => {
    const isCheckbox = event.target.type === "checkbox";
    this.setState({
      [event.target.name]: isCheckbox
        ? event.target.checked
        : event.target.value
    });
  

  // handleChange = input => e => {
  //   this.setState({ [input]: e.target.value });
    const { name, value } = event.target;
    let formErrors = this.state.formErrors;
    switch (name) {
      case "AlterEmail":
                formErrors.AlterEmail = emailRegex.test(value) ? '': 'invalidEmail Address'
                break;
                default:
                  break;
            }
            this.setState({ formErrors, [name]: value }, () => console.log(this.state));
          }

  handleSubmit(event) {
    event.preventDefault();
    
fetch("https://localhost:44383/api/AdditionalInformation", {

      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },

      
      body: JSON.stringify({
        AdditionalInfo_Id: null,
        AdditionalInfo_Background: event.target.Background.value,
        AdditionalInfo_CurrentJobTitle: event.target.CurrentJobTitle.value,
        AdditionalInfo_CompanyName: event.target.CompanyName.value,
        AdditionalInfo_EducationalInstitute: event.target.EducationalInstitute.value,
        AdditionalInfo_EducationLevel: event.target.EducationLevel.value,
        AdditionalInfo_Location: event.target.Location.value,
        AdditionalInfo_AlterPhoneNumber: event.target.AlterPhoneNumber.value,
        AdditionalInfo_AlterEmail: event.target.AlterEmail.value
      })
      
    })
    
    
      .then(res => res.json())
      .then((result) => {

        //this.setState({ message });
         console.log(result);

        //this.setState({ snackbaropen: true, snackbarmsg: result })
      },
        (error) => {
           alert('failed')
          //this.setState({ snackbaropen: true, snackbarmsg: 'failed' })
        }
      )
      
      
  }
  

  

  render()
   {
    
    return (
      <div className="wrapper">
        <div className="form-wrapper">
     
      <form onSubmit={this.handleSubmit}> 
    
      
        <h2>Additional Details</h2>
        <div className="Background">
          
         <label htmlFor="Background">Summary Headline  </label>
          
          
          <input

           name="Background"
            placeholder="Background"
            value={this.state.Background}
            onChange={this.handleChange}
          />
          
        </div>

        <div className="CurrentJobTitle">
        
        <label htmlFor="CurentJobTitle">Current Job Title </label> 
        
          
          <input
          
            name="CurrentJobTitle"
            placeholder=" Current job title"
            value={this.state.CurrentJobTitle}
            onChange={this.handleChange}
          />
          
        </div>

        <div className="CompanyName">
        
        <label htmlFor="CompanyName">Company Name  </label> 
        
          <input
            name="CompanyName"
            placeholder="Company Name"
            value={this.state.ompanyName}
            onChange={this.handleChange}
          />
          
        </div>
        
        <div className="EducationalInstitute">
        <label htmlFor="EducationalInstitute">Enter Institute  </label>
        
          <input
            name="EducationalInstitute"
            placeholder="Educational Institute"
            value={this.state.EducationalInstitute}
            onChange={this.handleChange}
          />
          
          </div>

          
          <div className="EducationLevel">
        
        <label htmlFor="EducationLevel">Degree </label>
        <select onChange={this.EducationLevelhandler} defaultValue="Select Degree">
        <option defaultValue>Select Degree</option>
                        <option value="Btech">B.Tech</option>
                        <option value="Mtech">M.Tech</option>
                        <option value="MBA">MBA</option>
                        <option value="BBA">BBA</option>
                        <option value="MCA">MCA</option>
                        <option value="BCA">BCA</option>
                        <option value="PHD">PHD</option>
                        <option value="MA">MA</option>
        </select>
        
          <input
            
            name="EducationLevel"
            placeholder="Education Level"
            value={this.state.EducationLevel}
            onChange={this.handleChange}
          />
          
        </div>
        <div className="Location">
        
         <label htmlFor="Location">Current Location </label>
        
          <input
            
            name="Location"
            placeholder="Location"
            value={this.state.Location}
            onChange={this.handleChange}
          />
          
        </div>

        <div className="AlterPhoneNumber">
          
         <label htmlFor="AlterPhoneNumber">Alternate Phone Number  </label>
          
          
          <input

           name="AlterPhoneNumber"
            placeholder=" Alternate Number"
            value={this.state.AlterPhoneNumber}
            onChange={this.handleChange}
          />
          </div>

          <div className="AlterEmail">
          
          <label htmlFor="AlterEmail">Alternate Email Address </label>
           
           
           <input
 
            name="AlterEmail"
             placeholder="Alternate email"
             value={this.state.AlterEmail}
             onChange={this.handleChange}
           />
           </div>
           


        <div className="createaccount">
        <button type="submit">submit</button>
        <li><a href="/Hello">SKIP</a></li>
        
        </div>
        
      </form>
      </div>
      </div>
      
    );
    
  }
  }