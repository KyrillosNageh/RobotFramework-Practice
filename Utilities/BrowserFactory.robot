*** Settings ***
Library    Browser
Library    SeleniumLibrary
Resource    ../Resources/Configurations/Execution.resource
Resource    ../Resources/Configurations/Environments.resource

*** Keywords ***
Initialize New Browser
    Open Browser    ${googleBaseUrl}    ${browserType}    
    Maximize Browser Window 
    Set Browser Implicit Wait    ${browserTimeout}