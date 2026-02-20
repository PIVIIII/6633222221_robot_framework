*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Open Booking Page
    Open Browser    https://panaryco.wixsite.com/myhotel    chrome
    Maximize Browser Window
    Go To    https://panaryco.wixsite.com/myhotel
    Wait Until Page Contains Element    //iframe    15s

    ${frames}=    Get WebElements    //iframe
    FOR    ${frame}    IN    @{frames}
        Select Frame    ${frame}
        ${count}=    Get Element Count    //input[@aria-label="First Name"]
        IF    ${count} > 0
            Exit For Loop
        END
        Unselect Frame
    END

Verify firstname is empty
    ${firstname}=    Get Value    //*[@id='input_comp-lt33fcq41']
    Should Be Equal    ${firstname}    ${EMPTY}

Input and verify firstname
    Input Text    //*[@id='input_comp-lt33fcq41']    ${hotel_booking_firstname}
    ${firstname}=    Get Value    //*[@id='input_comp-lt33fcq41']
    Should Be Equal    ${firstname}    ${hotel_booking_firstname}

Verify lastname is empty
    ${lastname}=    Get Value    //*[@id='input_comp-lt33fcs1']
    Should Be Equal    ${lastname}    ${EMPTY}

Input and verify lastname
    Input Text    //*[@id='input_comp-lt33fcs1']    ${hotel_booking_lastname}
    ${lastname}=    Get Value    //*[@id='input_comp-lt33fcs1']
    Should Be Equal    ${lastname}    ${hotel_booking_lastname}

Verify phone is empty
    ${phone}=    Get Value    //*[@id='input_comp-lt33fcsi1']
    Should Be Equal    ${phone}    ${EMPTY}

Input and verify phone
    Input Text    //*[@id='input_comp-lt33fcsi1']    ${hotel_booking_mobile_phone}
    ${phone}=    Get Value    //*[@id='input_comp-lt33fcsi1']
    Should Be Equal    ${phone}    ${hotel_booking_mobile_phone}

Verify email is empty
    ${email}=    Get Value    //*[@id='input_comp-lt33fcsf1']
    Should Be Equal    ${email}    ${EMPTY}

Input and verify email
    Input Text    //*[@id='input_comp-lt33fcsf1']    ${hotel_booking_email}
    ${email}=    Get Value    //*[@id='input_comp-lt33fcsf1']
    Should Be Equal    ${email}    ${hotel_booking_email}

Verify Number of adults is empty
    ${numberOfAdult}=    Get Value    //*[@id='collection_comp-lt33fcsl1']
    Should Be Equal    ${numberOfAdult}    ${EMPTY}

Select and verify Number of adults
    Scroll Element Into View    //*[@id="collection_comp-lt33fcsl1"]
    Wait Until Element Is Visible    //*[@id="collection_comp-lt33fcsl1"]    10s

    Click Element    //*[@id="collection_comp-lt33fcsl1"]

    Wait Until Page Contains Element    //*[text()="${number_of_adults}"]    10s
    Click Element    //*[text()="${number_of_adults}"]

    ${numberOfAdult}=    Get Text    //*[@id="collection_comp-lt33fcsl1"]
    Should Contain    ${numberOfAdult}    ${number_of_adults}

Select pet option
    Click Element    //div[@data-testid="radioGroup"]//*[text()="Yes"]

Verify note is empty
    ${note}=    Get Value    //*[@id='input_comp-lt33fct3']
    Should Be Equal    ${note}    ${EMPTY}

Input and verify note
    Input Text    //*[@id='input_comp-lt33fct3']    ${hotel_booking_note}
    ${note}=    Get Value    //*[@id='input_comp-lt33fct3']
    Should Be Equal    ${note}    ${hotel_booking_note}

Click Accept Term
    Scroll Element Into View    //input[@type="checkbox"]
    Sleep    1s
    Click Element    //input[@type="checkbox"]

Click submit application
    Click Element    //*[@class="l7_2fn wixui-button__label"]

Verify success message
    Wait Until Page Contains    Thanks for submitting!

Verify firstname required
    ${aria_invalid}=    Get Element Attribute    //*[@id='input_comp-lt33fcq41']    aria-invalid
    Should Be Equal As Strings    ${aria_invalid}    true

Verify lastname required
    ${aria_invalid}=    Get Element Attribute    //*[@id='input_comp-lt33fcs1']    aria-invalid
    Should Be Equal As Strings    ${aria_invalid}    true

Verify phone required
    ${aria_invalid}=    Get Element Attribute    //*[@id='input_comp-lt33fcsi1']    aria-invalid
    Should Be Equal As Strings    ${aria_invalid}    true

Verify email required
    ${aria_invalid}=    Get Element Attribute    //*[@id='input_comp-lt33fcsf1']    aria-invalid
    Should Be Equal As Strings    ${aria_invalid}    true

Verify numberOfAdult required
    ${aria_invalid}=    Get Element Attribute    //*[@id='collection_comp-lt33fcsl1']    aria-invalid
    Should Be Equal As Strings    ${aria_invalid}    true