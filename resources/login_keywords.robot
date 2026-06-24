*** Settings ***
Documentation    Keywords for login feature testing
Resource         common.robot

*** Keywords ***
User Performs Login
    [Documentation]    High-level keyword for complete login flow
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Wait For Home Screen

Enter Username
    [Documentation]    Focus and enter username
    [Arguments]    ${username}
    Wait And Click Element    ${LOGIN_USERNAME_INPUT}
    Type Text Into Element    ${LOGIN_USERNAME_INPUT}    ${username}

Enter Password
    [Documentation]    Focus and enter password
    [Arguments]    ${password}
    Wait And Click Element    ${LOGIN_PASSWORD_INPUT}
    Type Text Into Element    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login Button
    [Documentation]    Click the login submit button
    Wait And Click Element    ${LOGIN_BUTTON}

Wait For Home Screen
    [Documentation]    Wait for home screen to load after successful login
    Wait For Element To Be Visible    ${HOME_TITLE}    timeout=10s

Verify Login Error Message
    [Documentation]    Verify specific error message is shown
    [Arguments]    ${error_text}
    Verify Element Is Visible    ${LOGIN_ERROR_MESSAGE}
    Verify Element Text    ${LOGIN_ERROR_MESSAGE}    ${error_text}
