*** Settings ***
Resource    ../../Keywords/Object Models/ApisBooking.robot
Resource    ../../Keywords/Object Models/ApisUserManagement.robot
Resource    ../../Utilities/Helper.robot
Resource    ../../Object Models/Apis.robot

Suite Setup    Setup

*** Test Cases ***
Test Create Booking 1
    Create Booking    Kyrillos_Create${currentTime}    Nageh    1000000    true    2023-01-01    2024-01-01    Cream Caramel
    Validate That The Booking is Created    Kyrillos_Create${currentTime}    Nageh


Test Delete Booking
    [Setup]    Create Booking    Kyrillos_Delete${currentTime}    Nageh    1000000    true    2023-01-01    2024-01-01    Cream Caramel
    ${deleteResponse}=    Delete Booking    Kyrillos_Delete${currentTime}    Nageh
    Validate That Response Body Contains Value    ${deleteResponse}    Created
    Validate That Booking Does not Exist    Kyrillos_Delete${currentTime}    Nageh

*** Keywords ***
Setup
    Get Current Time Formatted
    Admin User Login