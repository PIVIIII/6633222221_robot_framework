*** Settings ***
Library    SeleniumLibrary
Resource    ../../testdata/test_data_hotel_booking.robot
Resource    ../../keywords/ui/page/hotelbooking.robot

Test Setup    Open browser hotel booking form
Test Teardown    Close Browser


*** Test Cases ***

Verify booking form with all input field
    Input and verify firstname
    Input and verify lastname
    Input and verify phone
    Input and verify email
    Select and verify Number of adults
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify success message


Verify single fault firstname
    Input and verify lastname
    Input and verify phone
    Input and verify email
    Select and verify Number of adults
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify firstname required


Verify single fault lastname
    Input and verify firstname
    Input and verify phone
    Input and verify email
    Select and verify Number of adults
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify lastname required


Verify single fault phone
    Input and verify firstname
    Input and verify lastname
    Input and verify email
    Select and verify Number of adults
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify phone required


Verify single fault email
    Input and verify firstname
    Input and verify lastname
    Input and verify phone
    Select and verify Number of adults
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify email required


Verify single fault numberOfAdult
    Input and verify firstname
    Input and verify lastname
    Input and verify phone
    Input and verify email
    Select pet option
    Input and verify note
    Click Accept Term
    Click submit application
    Verify numberOfAdult required