*** Settings ***
Library  SeleniumLibrary
Library    Browser

*** Variables ***
${MyAccount_Header}     xpath://*[contains(@class,'card-header') and text()='My Account']


*** Keywords ***
Verify My Account Page opened successfully
    Location Should Contain 	 account 	 The URL Doesn't contain it
    Page Should Contain Element 	 ${MyAccount_Header} 	     