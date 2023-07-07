*** Settings ***
Library  SeleniumLibrary
Library    JSONLibrary
Resource    ../Utilities/BrowserFactory.robot
Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Utilities/JsonTestDataReader.robot
Resource    ../../Keywords/Pages/HomePage.robot
Resource    ../../Keywords/Pages/RegisterPage.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Verify registration with valid data
    [Tags]     Smoke    Regression    Positive
    Navigate to ecommerce lambdatest home page
    Navigate to registeration page
    Create Account  ${testData["fristName"]}    ${testData["lastName"]}     ${testData["email"]}    ${testData["telephone"]}      ${testData["password"]}
    wait until page contains element    ${AccountCreated_Msg}
    Page Should Contain Element    ${AccountCreated_Msg} 
    Click Element   ${continue_Btn}

*** Keywords ***
Setup
    Load Test Data JSON File    registeration.json
    Initialize New Browser
    #Navigate To Google Home Page
    