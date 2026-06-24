*** Settings ***
Documentation    Appium server configuration and desired capabilities

*** Variables ***
# Appium Server
${APPIUM_SERVER_URL}    http://localhost:4723/wd/hub

# Android Capabilities - Adjust these for your app
&{ANDROID_CAPABILITIES}
...    platformName=Android
...    platformVersion=13.0
...    deviceName=emulator-5554
...    automationName=UiAutomator2
...    appPackage=com.example.app
...    appActivity=com.example.app.MainActivity
...    autoGrantPermissions=true
...    noReset=false
...    fullReset=false

# iOS Capabilities - Example for iOS testing
&{IOS_CAPABILITIES}
...    platformName=iOS
...    platformVersion=17.0
...    deviceName=iPhone 15
...    automationName=XCUITest
...    bundleId=com.example.app
...    xcodeOrgId=YOUR_ORG_ID
...    xcodeSigningId=iPhone Developer

# Common Appium Settings
${IMPLICIT_WAIT_MS}    10000
${EXPLICIT_WAIT_MS}    5000
${SCROLL_DURATION}     500
