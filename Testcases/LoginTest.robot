*** Settings ***
#Library  DebugLibrary
Resource    ../Keywords/Login_Keywords.robot
Resource    ../Variables/Common_Variables.robot

#Suite Setup  OpenApplicationURL        # you can also setup and teardown at suit level, means setup and teardown part will execute before/after the execution of all tests
#Suite Teardown  CommonTestTearDown
Test Setup  OpenApplicationURL                  # This setup part will run before every test
Test Teardown  CommonTestTearDown                # This teardown part will run before every test


*** Test Cases ***
Verify successful login to application
    [Tags]  smoke
    [Documentation]     This testcase verfiy the successful login of user to the application
    #debug if     5==5
    ${PageTitle}=   LoginToApplication  ${USER_NAME}    ${PASSWORD}     # store the returned value from keyword in a variable
    log to console  Title of the page is : ${PageTitle}
#
#Verify that a new user is able to register the application successfully
#    [Tags]  regression
#    [Documentation]  This test case verfies the successful registration of user to the app
#    UserRegistration
#
#
#Get all the links from login page of the application
#    [Documentation]  This test case extract all the links from the login page of the application
#    [Tags]  regression
#    ${AlllinkTextCount}=     get matching xpath count  //a[contains(@href,'php')]
#    should be true  ${AlllinkTextCount} > 2     # verify that number of links are more than 2 on that page
#    :FOR   ${i}   IN RANGE   1   ${AlllinkTextCount}
#    \   ${LinkText}=    get text  //a[contains(@href,'php')][${i}]
#    \   log to console  ${LinkText}
