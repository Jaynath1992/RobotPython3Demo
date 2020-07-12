*** Variables ***

# Locator for login screen

${TEXTBOX_USER_NAME}    //input[@name='userName']                    #//input[@name='userName']
${TEXTBOX_PASSWORD}     //input[@name='password']                    #//input[@name='password']
${BUTTON_SIGNIN}        //input[@name='login']                       #//input[@name='login']
${LINK_SIGN_ON}      //*[text()='SIGN-ON']
${LINK_REGISTER}     //a[text()='REGISTER']
${LINK_SUPPORT}      //a[text()='SUPPORT']
${LINK_CONTACT}      //a[text()='CONTACT']



# Locators on Registration page
${TEXTBOX_FIRSTNAME}     //input[@name='firstName']
${TEXTBOX_LASTNAME}        //input[@name='lastName']
${TEXTBOX_REGISTRATION_USER_NAME}       //input[@id='email']
${TEXTBOX_REGISTRATION_PASSWORD}        //input[@name='password']
${TEXTBOX_CONFIRM_PASSWORD}     //input[@name='confirmPassword']
${BUTTON_SUBMIT_USER_REGISTRATION}      //input[@name='register']
${TEXT_USER_REGISTRATION}       //*[contains(text(),'Your user name')]
${LINK_SIGN_OFF}        //a[text()='SIGN-OFF']


${BUTTON_CONTINUE}      //input[@name='findFlights']