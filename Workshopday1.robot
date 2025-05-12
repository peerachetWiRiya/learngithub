*** Settings ***
Library  OperatingSystem
Test Setup    Setup Test Environment
Test Teardown    Cleanup Environment


*** Variables ***
${name1}    Bike
@{numbers}    1    2    3    4    5
&{person}    name=Bike    age=28    job=QA Engineer
${greeting}    Hello, ${name}
${username}    user1
${password}    pass123
${value}    5
@{items}    Apple    Banana    Orange
@{fruits}    Apple    Banana    Orange
# ${env_var}    %{MY_ENV_VAR}
@{usernames}    user1    user2    user3
${prefix}    Mr.
${name}    Smith
${env}    Production
&{user3}    username=admin    password=1234



*** Keywords ***
Login To App
    [Arguments]    ${user}    ${pass}
    Log    Logging in with ${user} and ${pass}
Print Message
    [Arguments]   ${message}=Hello,World
    Log    ${message}
Setup Test Environment
    Log    Setting up ${env} environment
Cleanup Environment
    Log    Cleaning up ${env} environment


*** Test Cases ***
Print Name
    Log    ${name1}
Print Numbers
    Log    ${numbers}
Print Person Info
    Log    ${person.name}
    Log    ${person.age}
Greet Person
    Log    ${greeting}
Login Test
    Login To App    ${username}    ${password}
Check Value
    IF    ${value} > 10
        Log    Value is greater than 10
    ELSE
        Log    Value is 10 or less
    END
Loop Through Items
    FOR    ${item}    IN    @{items}
        Log    ${item}
    END
Print First Fruit
    Log    ${fruits[0]}

# Print Environment Variable
#     [tags]  9
#     Log    ${env_var}

Test Default Variable
    Print Message

Loop Through Users
    FOR    ${user}    IN    @{usernames}
        Log    Logging in with ${user}
    END

Set Dynamic Variable
    ${var} =    Set Variable    5
    Log    ${var}
Combine Variables
    ${full_name} =    Set Variable    ${prefix} ${name}
    Log    ${full_name}

Calculate Sum
    ${sum} =    Evaluate    5 + 10
    Log    ${sum}

Generate Random Number
    ${random_number} =    Evaluate    random.randint(1, 100)    modules=random
    Log    ${random_number}

Read From File
    ${file_content} =    Get File    example.txt
    Log    ${file_content}

Sample Test
    Log    Running in ${env}

Set Global Variable
    [Tags]  19
    Set Global Variable    ${global_var}    Global Value

Use Global Variable
    [Tags]  19
    Log    ${global_var}
Login With Dictionary
    Log    ${user3['username']}
    Log    ${user3['password']}