*** Settings ***
Documentation    Common keywords and setup/teardown for all tests
Library    AppiumLibrary
Resource    locators.robot

*** Variables ***
${APPIUM_SERVER}    http://localhost:4723/wd/hub
${IMPLICIT_WAIT}    10s
${EXPLICIT_WAIT}    5s

*** Keywords ***
Open Application With Config
    [Documentation]    Opens mobile application with Appium
    [Arguments]    ${capabilities}
    Open Application    ${APPIUM_SERVER}    **${capabilities}

Close Application Safely
    [Documentation]    Closes application and cleans up session
    Close Application

Wait For Element To Be Visible
    [Documentation]    Waits for element to be visible on screen
    [Arguments]    ${locator}    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Page Contains Element    ${locator}    timeout=${timeout}

Verify Element Is Visible
    [Documentation]    Asserts that element is visible
    [Arguments]    ${locator}    ${message}=Element not visible
    Element Should Be Visible    ${locator}    ${message}

Verify Element Text
    [Documentation]    Asserts element contains expected text
    [Arguments]    ${locator}    ${expected_text}
    Element Text Should Be    ${locator}    ${expected_text}

Wait And Click Element
    [Documentation]    Waits for element then clicks it
    [Arguments]    ${locator}
    Wait For Element To Be Visible    ${locator}
    Click Element    ${locator}

Type Text Into Element
    [Documentation]    Clears and types text into element
    [Arguments]    ${locator}    ${text}
    Clear Text    ${locator}
    Input Text    ${locator}    ${text}

Swipe Down
    [Documentation]    Performs downward swipe gesture
    Swipe    ${EMPTY}    600    ${EMPTY}    200    duration=500

Swipe Up
    [Documentation]    Performs upward swipe gesture
    Swipe    ${EMPTY}    200    ${EMPTY}    600    duration=500
