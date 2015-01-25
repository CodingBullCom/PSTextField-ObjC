PSTextField-ObjC
================

### Introduction : -
This is a open source library, written in Objective C and Swift both. It gives you a compact layer to have all your textfield validation mechanism at a place and fully organised. We all write code for validation and verification of textfields in our application. I have collected my past work and put it here for you. Let's directly jump at code.

### Screenshot : -

<img src="http://1.bp.blogspot.com/-5h5fBpr6Xzs/U_CynaDNzoI/AAAAAAAAA3E/FWixxNenrGE/s1600/error_popup1.png"  height="568" width="320" align="middle">

### Source code: 
source code available at github, please get it from below urls: -

**Objective C** :  https://github.com/pawan4444/PSTextField-ObjC  
**Swift** : https://github.com/pawan4444/PSTextField-Swift

Integration Steps:  
Three simple step:  

  In storyboard/xib, add a UITextField and map the class to PSTextField.  
  Set the type of validation (PSDataValidationType) you want for this textfield.  
  Call validateInput method  
Checkout the demo project at from github.

### API:  
`- (void)validateInput;`

### Validation Type:
  PSDataValidationTypePassword = 1,   //alphanumeric password like hs939wd!  
  PSDataValidationTypeUserName,       //alphanumeric username like john231  
  PSDataValidationTypeFirstName,      //First name like Ramesh, Suresh, Gita etc  
  PSDataValidationTypeLastName,       //Last name Yadav, Naidu etc  
  PSDataValidationTypeEmail,          //Email id vishu@subdomain.domain  
  PSDataValidationTypeMobileNumber,   //Mobile number - +911234567890  
  PSDataValidationTypeDate,  
  PSDataValidationTypeTime,  
  PSDataValidationTypePlace,  
  PSDataValidationTypeCity,  
  PSDataValidationTypeState,  
  PSDataValidationTypeCountry,  
  PSDataValidationTypeDefault         //Will check for empty string  
