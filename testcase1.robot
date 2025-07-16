*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Environment Variables Example
    ${user}=    Get Environment Variable    USER
    Log    Current user: ${user}

    ${path}=    Get Environment Variable    PATH
    Log    PATH: ${path}

    Set Environment Variable    MY_VAR    hello_world
    ${my_var}=    Get Environment Variable    MY_VAR
    Should Be Equal    ${my_var}    hello_world

    Log    Inline example: %{MY_VAR}

    ${os}=    Evaluate    __import__('platform').system()
    Log    OS is: ${os}