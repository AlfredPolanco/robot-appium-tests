*** Settings ***
Documentation    Application element locators - organized by screen/feature

*** Variables ***
# Common locators
${BACK_BUTTON}         id=android:id/action_bar_up
${ACCEPT_BUTTON}       xpath=//android.widget.Button[@text='Accept']

# Login Screen
${LOGIN_USERNAME_INPUT}    id=com.example.app:id/username
${LOGIN_PASSWORD_INPUT}    id=com.example.app:id/password
${LOGIN_BUTTON}            id=com.example.app:id/login_btn
${LOGIN_ERROR_MESSAGE}     xpath=//android.widget.TextView[@text='Invalid credentials']

# Home Screen
${HOME_TITLE}             id=com.example.app:id/home_title
${USER_PROFILE_ICON}      accessibility_id=Profile
${LOGOUT_BUTTON}          id=com.example.app:id/logout

# Settings Screen
${SETTINGS_DARK_MODE}        xpath=//android.widget.Switch[@resource-id='com.example.app:id/dark_mode_toggle']
${SETTINGS_NOTIFICATIONS}    id=com.example.app:id/notifications_toggle

# Common patterns
# Note: Adjust package name (com.example.app) to your actual app package
# Locator strategies priority:
# 1. id (most reliable)
# 2. accessibility_id (good for accessibility)
# 3. xpath (last resort, brittle)
