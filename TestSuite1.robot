*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Suite Setup   Log    I am insite Test Suite Setup.
Suite Teardown    Log    I am insite Test Suite Teardown.
Test Setup     Log    I am insite Test Setup. 
Test Teardown     Log    I am insite Test Teardown. 

Default Tags    Sanity

*** Test Cases ***

FirstSimpleRobotFrameworkTest
    [Tags]    Smoke
    Log    Hello World 1...

Second Simple RobotFrameork Test
    Log    Hello World 2...
    Set Tags    Regression 1
    Remove Tags     tRegression1

Third Simple RobotFrameork Test
    Set Tags    Regression 2
    Log    Hello World 3...

Fourth Simple RobotFrameork Test
    Log    Hello World 4...

# First Selenium Test
#     Open Browser    https://www.google.com    chrome
#     Set Browser Implicit Wait    5
#     Input Text    name=q   Automation step by step
#     Press Key    name=btnK     ENTER
#     Sleep    2
#     Close Browser
#     Log    Test Completed

# Sample Login Test with Variable Types
#     Open Browser    ${URL}    chrome
#     Maximize Browser Window
#     Wait Until Element Is Visible    name=username    10s 
#     LoginKW
#     Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/span/p
#     Click Element    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/span/p
#     Click Element    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/ul/li[4]/a
#     Title Should Be    OrangeHRM
#     Close Browser
#     Log    Test Completed
#     ${user}=    Get Current User
#     ${os}=     Get Current OS
#     Log    This test was executed by ${user} on ${os}.

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com 
@{Credentials}    Admin     admin123
&{LoginData}    username=Admin    password=admin123

*** Keywords ***
LoginKW 
    Input Text    name=username    ${Credentials[0]}
    Input Password    name=password    ${LoginData.password}
    Click Button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Get Current User
    ${user}=    Evaluate    os.environ.get('USER', '')    modules=os
    RETURN    ${user}

Get Current OS
    ${os}=    Evaluate    platform.system()    modules=platform
    RETURN   ${os}