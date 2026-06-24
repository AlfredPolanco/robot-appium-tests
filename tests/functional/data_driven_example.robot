*** Settings ***
Documentation    Example of data-driven testing patterns
Test Template     User Login Should Result In Expected Outcome
Resource         ../resources/common.robot
Resource         ../config/appium_server.robot

*** Test Cases ***
Valid Login               testuser@example.com        password123         HOME_TITLE
Invalid Username          invalid@example.com         password123         LOGIN_ERROR_MESSAGE
Invalid Password          testuser@example.com        wrongpass           LOGIN_ERROR_MESSAGE
Empty Username            ${EMPTY}                    password123         LOGIN_ERROR_MESSAGE
Empty Password            testuser@example.com        ${EMPTY}             LOGIN_ERROR_MESSAGE

*** Keywords ***
User Login Should Result In Expected Outcome
    [Documentation]    Data-driven template for login scenarios
    [Arguments]    ${username}    ${password}    ${expected_element}
    [Setup]        Open Application With Config    ${DESIRED_CAPABILITIES}
    [Teardown]     Close Application Safely

    IF    '${username}' != '${EMPTY}'
        Wait And Click Element    ${LOGIN_USERNAME_INPUT}
        Type Text Into Element    ${LOGIN_USERNAME_INPUT}    ${username}
    END

    IF    '${password}' != '${EMPTY}'
        Wait And Click Element    ${LOGIN_PASSWORD_INPUT}
        Type Text Into Element    ${LOGIN_PASSWORD_INPUT}    ${password}
    END

    Wait And Click Element    ${LOGIN_BUTTON}

    ${locator}=    Get Variable Value    $\{${expected_element}}
    Wait For Element To Be Visible    ${locator}

*** Variables ***
${DESIRED_CAPABILITIES}    &{ANDROID_CAPABILITIES}
