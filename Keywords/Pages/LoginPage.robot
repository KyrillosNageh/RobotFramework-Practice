*** Settings ***
Library  SeleniumLibrary
Library    Browser

#Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${Email_Txt}    id:input-email
${Password_Txt} id:input-password
${Login_Btn}    xpath://*[@value ='Login']
${Alert_Msg}    xpath://*[contains(@class,'alert-dismissible')]


*** Keywords ***
Signup 
    [Arguments]     ${username}     ${password}
    Input Text  ${Email_Txt}    ${username}
    Input Text  ${Password_Txt}    ${password}
    Click Button    ${Login_Btn}

Click Login 
    Click Button    ${Login_Btn}

Verify Alert Message
    [Arguments]     ${message}
    Element Should Contain 	 ${Alert_Msg} 	 ${message} 	 message=None 	 ignore_case=False 