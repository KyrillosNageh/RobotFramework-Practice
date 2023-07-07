*** Settings ***
Library  SeleniumLibrary
Library    Browser

*** Variables ***
${Firstname_Txt}    id:input-firstname
${Lastname_Txt}     id:input-lastname
${Email_Txt}    id:input-email
${Telephone_Txt}    id:input-telephone
${Password_Txt}     id:input-password
${ConfirmPassword_Txt}  id:input-confirm
${Agreement_Checkbox}   css=label[for='input-agree']
${RegisterContinue_Btn}     xpath://*[@value ='Continue']


*** Keywords ***
Create Account 
    [Arguments]     ${fristname}    ${lastname}     ${email}    ${telephone}    ${password}
    Input Text  ${Firstname_Txt}    ${fristname}
    Input Text  ${Lastname_Txt}    ${lastname}
    Input Text  ${Email_Txt}    ${email}
    Input Text  ${Telephone_Txt}    ${telephone}
    Input Text  ${Password_Txt}    ${password}
    Input Text  ${ConfirmPassword_Txt}    ${password}
    Click Element  ${Agreement_Checkbox}
    Click Element  ${RegisterContinue_Btn} 