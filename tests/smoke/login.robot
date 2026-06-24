*** Settings ***
Documentation    Smoke tests for login functionality
Suite Setup      Setup Test Suite
Suite Teardown   Teardown Test Suite
Test Setup       Open Application With Config    ${DESIRED_CAPABILITIES}
Test Teardown    Close Application Safely
Resource         ../resources/common.robot
Resource         ../config/appium_server.robot

*** Variables ***
${DESIRED_CAPABILITIES}    &{ANDROID_CAPABILITIES}

*** Test Cases ***
User Can Login With Valid Credentials
    [Documentation]    Verify user successfully logs in with valid credentials
    [Tags]    smoke    login
    Wait And Click Element    ${LOGIN_USERNAME_INPUT}
    Type Text Into Element    ${LOGIN_USERNAME_INPUT}    testuser@example.com
    Wait And Click Element    ${LOGIN_PASSWORD_INPUT}
    Type Text Into Element    ${LOGIN_PASSWORD_INPUT}    password123
    Wait And Click Element    ${LOGIN_BUTTON}
    Wait For Element To Be Visible    ${HOME_TITLE}
    Verify Element Is Visible    ${HOME_TITLE}

Login Fails With Invalid Password
    [Documentation]    Verify appropriate error message for invalid password
    [Tags]    smoke    login    negative
    Wait And Click Element    ${LOGIN_USERNAME_INPUT}
    Type Text Into Element    ${LOGIN_USERNAME_INPUT}    testuser@example.com
    Wait And Click Element    ${LOGIN_PASSWORD_INPUT}
    Type Text Into Element    ${LOGIN_PASSWORD_INPUT}    wrongpassword
    Wait And Click Element    ${LOGIN_BUTTON}
    Wait For Element To Be Visible    ${LOGIN_ERROR_MESSAGE}
    Verify Element Is Visible    ${LOGIN_ERROR_MESSAGE}
    Verify Element Text    ${LOGIN_ERROR_MESSAGE}    Invalid credentials

*** Keywords ***
Setup Test Suite
    [Documentation]    Initialize test suite (e.g., start Appium server)
    Log    Starting test suite setup

Teardown Test Suite
    [Documentation]    Clean up after test suite
    Log    Cleaning up test suite
