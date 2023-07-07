*** Settings ***
Library  SeleniumLibrary
Library    Browser

*** Variables ***
${MyAccount_Header}     xpath://*[contains(@class,'card-header') and text()='My Account']
${Search_Header}    xpath://*[@class='h4']
${SearchResult_Products}    xpath://*[@class='text-ellipsis-2']


*** Keywords ***
Verify search result page contains the Keyword
    [Arguments]     ${Keyword}
    Element Text Should Be 	 ${Search_Header} 	 ${Keyword}

Verify search result products contains the Keyword
    [Arguments]     ${Keyword}
    ${products}=    Get WebElements    ${SearchResult_Products}
    FOR    ${product}    IN    @{products}
        ${text}=    Get Text    ${product}
        BuiltIn.Should Contain  	 ${text} 	 ${Keyword}
    END