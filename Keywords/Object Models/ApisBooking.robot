*** Settings ***
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary
Library    json
Library    OperatingSystem
Library     Collections
Resource    Apis.robot

*** Variables ***
${booking_serviceName}    /booking

*** Keywords ***
Create Booking
    [Arguments]    ${firstName}    ${lastName}    ${totalPrice}    ${depositPaid}    ${bookingDates_checkin}    ${bookingDates_checkout}    ${additionalNeeds}
    ${bookingDatesBody}=    Create Dictionary    checkin=${bookingDates_checkin}    checkout=${bookingDates_checkout}
    ${jsonBody}=    Create Dictionary    firstname=${firstName}    lastname=${lastName}    totalprice=${totalPrice}    depositpaid=${depositPaid}    bookingdates=${bookingDatesBody}    additionalneeds=${additionalNeeds}
    ${response}=    POST On Session    restfulBooker    ${booking_serviceName}    json=${jsonBody}
    [Return]    ${response}

Create Booking with Body as JSON File
    [Arguments]    ${filePath}
    ${jsonBody}=    Load Json From File    ${EXECDIR}${filePath}
    ${response}=    POST On Session    restfulBooker    ${booking_serviceName}    json=${jsonBody}
    [Return]    ${response}

Get Booking Ids
    [Arguments]    ${firstName}    ${lastName}
    ${queryParams}=    Create Dictionary    firstname=${firstName}    lastname=${lastName}
    ${response}=    GET On Session    restfulBooker    ${booking_serviceName}    params=${queryParams}
    [Return]    ${response}

Get Booking Id
    [Arguments]    ${first_name}    ${last_name}
    ${response}=    Get Booking Ids    ${first_name}    ${last_name}
    ${json}=    Evaluate    json.loads('''${response.content}''')
    ${booking_id}=    Get From Dictionary    ${json[0]}    bookingid
    [Return]    ${booking_id}

Get Booking
    [Arguments]    ${firstName}    ${lastName}
    ${bookingId}=    Get Booking Id    ${firstName}    ${lastName}
    ${response}=    GET On Session    restfulBooker    ${booking_serviceName}/${bookingId}
    [Return]    ${response}

Delete Booking
    [Arguments]    ${firstName}    ${lastName}
    ${bookingId}=    Get Booking Id    ${firstName}    ${lastName}
    ${response}=    Delete On Session    restfulBooker    ${booking_serviceName}/${bookingId}
    [Return]    ${response}


############# Validations ############
Validate That The Booking is Created
    [Arguments]    ${expected_first_name}    ${expected_last_name}
    ${response}=    Get Booking    ${expected_first_name}    ${expected_last_name}
    ${json}=    Evaluate    json.loads('''${response.content}''')
    Log To Console   ${json}
    ${actual_first_name}=    Get From Dictionary    ${json}    firstname
    ${actual_last_name}=    Get From Dictionary    ${json}    lastname
    Should Be Equal As Strings    ${actual_first_name}    ${expected_first_name}
    Should Be Equal As Strings    ${actual_last_name}    ${expected_last_name}

Validate That Booking Does not Exist
    [Arguments]    ${firstName}    ${lastName}
    ${response}=    Get Booking Ids    ${firstName}    ${lastName}
    Validate That Response Body Contains Value    ${response}    []
