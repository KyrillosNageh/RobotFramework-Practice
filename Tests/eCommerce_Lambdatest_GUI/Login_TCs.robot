*** Settings ***
Library     SeleniumLibrary
Library     JSONLibrary
Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Utilities/JsonTestDataReader.robot
Resource    ../../Keywords/Pages/HomePage.robot
Resource    ../../Keywords/Pages/RegisterPage.robot
Resource    ../../Keywords/Pages/LoginPage.robot
Resource    ../../Keywords/Pages/AccountPage.robot
#Variables   ../../PageObjects/Locators.py

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***
${WrongPasswordOrEmail}  Warning: No match for E-Mail Address and/or Password.
${msg}      Warning: Your account has exceeded allowed number of login attempts. Please try again in 1 hour.

*** Test Cases ***
Verify Login with valid data
     [Tags]     Smoke    Regression    Positive
    Navigate to ecommerce lambdatest home page
    Navigate to login page
    Signup  ${testData["email"]}    ${testData["password"]}   


Verify Login with empty data
     [Tags]     Smoke    Regression    Negative
    Navigate to ecommerce lambdatest home page
    Navigate to login page
    Click Login 
    Verify Alert Message  ${WrongPasswordOrEmail}

*** Keywords ***
Setup
    Load Test Data JSON File    users.json
    Initialize New Browser  
    