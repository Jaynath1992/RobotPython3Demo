*** Settings ***
Library  SeleniumLibrary
Resource  ../Variables/Common_Variables.robot
Resource  ../Components/LoginPageObjects.robot


*** Keywords ***
OpenApplicationURL
    [Documentation]  This keyword launch application url in the browser
    ...    Author  Jaynath Kumar
	${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
	Call Method    ${options}    add_argument    headless
	Call Method    ${options}    add_argument    disable-gpu
	Call Method    ${options}    add_argument    --no-sandbox
	Create WebDriver  Chrome  chrome_options=${options}
	Goto  ${LOGIN_URL}
    #open browser  ${LOGIN_URL}  headlesschrome
	#open browser  ${LOGIN_URL}  headlesschrome
#   Run Keyword If  '${BROWSER}'.strip().lower()=='firefox'    open browser  ${LOGIN_URL}    ${BROWSER}   ff_profile_dir=${FF_PROFILE}
#    ...     Else If '${BROWSER}'=='Chrome'  open browser  ${LOGIN_URL}  ${BROWSER}
#    ...     ELSE    IF  '${BROWSER}'  ==  'IE'    open browser  ${LOGIN_URL}  ${BROWSER}
#    ...     ELSE    open browser  ${LOGIN_URL}  ${BROWSER}
    maximize browser window
    sleep  1                # Hardcoded wait in selenium robot framework
    ${title}=   get title   # This is how you can store the value returned by a a keyword in a variable, give = and tab
    title should be  Welcome: Mercury Tours
    ${get_default_selenium_speed}   get selenium speed
    log to console  Default selenium speed is : ${get_default_selenium_speed}
    #set selenium speed  1   # when you set the selenium speed, then every statement execution will happen after delay of 1 seconds
    ${get_default_selenium_implicit_wait}   get selenium implicit wait
    log to console  Default selenium implicit timeout is : ${get_default_selenium_implicit_wait}
    set selenium implicit wait  5 seconds     # This wait will be applicable for all test cases if element is not found
    # Implicit wait once set will be applicable for all the statements inside test cases, it will wait for that much time if elemnt is not found before throwing exception
    # By default all statement inside test case runs with delay time of 0 seconds, so this is how you can set implicit wait
    ${get_default_selenium_wait_timeout}    get selenium timeout
    log to console  Default selenium wait timeout is : ${get_default_selenium_wait_timeout}
    set selenium timeout  20 seconds    # Now if you set timeout, then wait condition will wait for max. 20 seconds
    # Now this above timeout condition will be applicable only for the wait condition statement, not for othr statements
    wait until element is visible   ${BUTTON_SIGNIN}  timeout=10    # selenium timeout, wait for a condition
    # Default timeout is 5 seconds in case of wait condition if you don't specify timeout
    [Return]  ${title}

LoginToApplication
    [Arguments]  ${USER_NAME_VALUE}   ${PASSWORD_VALUE}         # This is how you can receive  arguments value passed
    #input text  name:userName    ${USER_NAME_VALUE}
    input text  ${TEXTBOX_USER_NAME}    ${USER_NAME_VALUE}
    input text  ${TEXTBOX_PASSWORD}     ${PASSWORD_VALUE}
    #input text  name:password     ${PASSWORD_VALUE}
    click element  ${BUTTON_SIGNIN}
    wait until element is visible  ${BUTTON_CONTINUE}   timeout=20
    log to console  Successfully logged in to application

CloseAllBrowser
    close all browsers

CommonTestTearDown
    ${Screenshot_Path}  set variable    ${Screenshot_Dir}/${TEST_NAME}.png  # This is how you can set value of a variable
    Run Keyword If Test Failed    Capture Page Screenshot   ${Screenshot_Path}  # capture and store image to this path
    close browser

UserRegistration
    click element  ${LINK_REGISTER}
    wait until element is visible  ${TEXTBOX_REGISTRATION_USER_NAME}
    input text  ${TEXTBOX_FIRSTNAME}    ${NEW_USER_FIRST_NAME}
    input text  ${TEXTBOX_LASTNAME}     ${NEW_USER_LAST_NAME}
    input text  ${TEXTBOX_REGISTRATION_USER_NAME}   ${NEW_USER_NAME}
    input text  ${TEXTBOX_REGISTRATION_PASSWORD}    ${NEW_USER_PASSWORD}
    input text  ${TEXTBOX_CONFIRM_PASSWORD}         ${NEW_USER_CONFIRM_PASSWORD}
    click element  ${BUTTON_SUBMIT_USER_REGISTRATION}
    wait until element is visible  ${TEXT_USER_REGISTRATION}
    log to console  User Registration is successful and now check whether user is able to login or not
    # Now log off the user
    click element  ${LINK_SIGN_OFF}
    wait until element is visible  ${textbox_user_name}
    # Now login using the newly created user
    click element  ${LINK_SIGN_ON}
    wait until element is visible  ${TEXTBOX_USER_NAME}     timeout=10
    input text  ${TEXTBOX_USER_NAME}    ${NEW_USER_NAME}
    input text  ${TEXTBOX_PASSWORD}     ${NEW_USER_PASSWORD}
    click element   ${BUTTON_SIGNIN}
    wait until element is visible  ${BUTTON_CONTINUE}   timeout=10
    log to console  USER is successfully registered to app and now able to login

CapturePageScrenshot
    capture page screenshot