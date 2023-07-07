*** Settings ***
Library  SeleniumLibrary
Library    Browser

Resource    ../../Resources/Configurations/Environments.resource

*** Variables ***
${Url}  https://ecommerce-playground.lambdatest.io/ 
${MyAccount_Menu}   link:My account
${Register_Link}    link:Register
${Login_Link}   link:Login
${Logout_Link}  link:Logout
${Search_Bar}   name:search
${Search_Btn}   css=[type='submit']


*** Keywords ***
Navigate to ecommerce lambdatest home page
    Go TO    ${Url}

Navigate to registeration page
    Mouse Over  ${MyAccount_Menu}
    Click Link  ${Register_Link}

Navigate to login page
    Mouse Over  ${MyAccount_Menu}
    Click Element  ${Login_Link}
    
Logout
    Mouse Over  ${MyAccount_Menu}
    Click Link  ${Logout_Link}

Search 
    [Arguments]     ${Keyword}
    Input Text  ${Search_Bar}    ${Keyword}
    Click Button   ${Search_Btn} 
