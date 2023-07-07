*** Settings ***
Library     SeleniumLibrary
Library     JSONLibrary
Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Utilities/JsonTestDataReader.robot
Resource    ../../Keywords/Pages/HomePage.robot
Resource    ../../Keywords/Pages/RegisterPage.robot
Resource    ../../Keywords/Pages/LoginPage.robot
Resource    ../../Keywords/Pages/AccountPage.robot
Resource    ../../Keywords/Pages/SearchResultPage.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***
${keyword}      Canon
${Header}   Search - Canon

*** Test Cases ***
Verify search Result page contains the search keyword
     [Tags]     Smoke    Regression    Positive
    Navigate to ecommerce lambdatest home page
    Search   ${keyword}
    Verify search result page contains the Keyword      ${Header}
    Verify search result products contains the Keyword      ${keyword}


*** Keywords ***
Setup
    Load Test Data JSON File    users.json
    Initialize New Browser  
    