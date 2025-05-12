*** Settings ***
Library    SeleniumLibrary
Library    Collections
*** Variables ***
${NUMBER}        42
${MESSAGE}       Hello, Robot Framework!
${URL}           https://example.com
${VALUE1}        10
${VALUE2}        5
@{FRUITS}        Apple    Banana    Cherry
@{Mylist}        durian 
@{VEGETABLES}    Tomato    Cucumber
@{FOOD}          @{FRUITS}    @{VEGETABLES}
&{USER}          name=Alice    age=25    city=NY
&{ADDRESS}       street=123 Main St    zip=94101
&{FULL_PROFILE}  &{USER}    &{ADDRESS}
&{DEPARTMENT}    IT=&{IT_TEAM}    HR=&{HR_TEAM}
&{IT_TEAM}       name=Alice    role=Engineer
&{HR_TEAM}       name=Bob      role=Manager
${BASE_URL}      https://example.com
${ENDPOINT}      ${BASE_URL}/api/user


*** Keywords ***
Create Sample List
    [Return]    Apple    Orange    Banana
Log User Info
   [Arguments]    &{USER}
   Log            Name: ${USER['name']}
   Log            Age: ${USER['age']}
   Log            City: ${USER['city']}
Check Age
    [Arguments]    ${AGE}
    Run Keyword If    ${AGE} > 18    Log    You are an adult.
    ...               ELSE    Log    You are a minor.
Manage Profile
   [Arguments]    ${NAME}    ${AGE}    @{HOBBIES}    &{ADDRESS}
   Log            Name: ${NAME}
   Log            Age: ${AGE}
   Log            Hobbies: ${HOBBIES}
   Log            Address: ${ADDRESS['city']}

*** Test Cases ***

TC01_Print Message
    [Tags]  Print Message  ready
    Log    ${MESSAGE}

TC02_Display Number
    [Tags]  Display Number ready
    Log    ${NUMBER}

TC03_Open Website
    [Tags]   Open Website  ready
    Open Browser    ${URL}    Chrome
    Close Browser

TC04_Sum Calculation
    [Tags]    Sum Calculation  ready
    ${RESULT}=    Evaluate    ${VALUE1} + ${VALUE2}
    Log    ${RESULT}

TC05_Local Variable Example
    [Tags]    Local Variable Example  ready
    ${LOCAL}      Set Variable    Temporary Value
    Log           ${LOCAL}

TC06_Print List
    [Tags]    List  Print List  ready
    Log    ${FRUITS[0]}
    Log    ${FRUITS[1]}
    Log    ${FRUITS[2]}
TC07_Iterate List
    [Tags]    List  Iterate List  ready
    FOR    ${FRUIT}    IN    @{FRUITS}
        Log    ${FRUIT}
    END
Append To List
    [Tags]    List  additionnal
    Append To List    ${Mylist}   apple    orange    cherry
    # Log               ${FRUITS[1]}
TC08_Append To List
    [Tags]    List  Append To List   
    Append To List    ${FRUITS}    Orange
    Log               ${FRUITS[-1]}    
TC09_Display Foods
    Log    ${FOOD}

TC10_Use List From Keyword
    ${FRUITS}=    Create Sample List
    Log           ${FRUITS[1]}

TC11_Display User Details
   Log    ${USER['name']}
   Log    ${USER['age']}
   Log    ${USER['city']}

TC12_Iterate Dictionary
   FOR    ${KEY}    ${VALUE}    IN    &{USER}
       Log    ${KEY}: ${VALUE}
   END
TC13_Update Dictionary Value
   Set To Dictionary    ${USER}    city=San Francisco
   Log    ${USER['city']}

TC14_Display Full Profile
   Log    ${FULL_PROFILE}

TC15_Access Dictionary In Keywords
   Log User Info    &{USER}

TC16_Access Matrix
    ${ROW1}=    Create List    1    2    3
    ${ROW2}=    Create List    4    5    6
    ${MATRIX}=    Create List    ${ROW1}    ${ROW2}
    
    Log    ${MATRIX[0][1]}
    Log    ${MATRIX[1][2]}

TC17_Access Nested Dictionary
   Log    ${DEPARTMENT['IT']['name']}
   Log    ${DEPARTMENT['HR']['role']}

TC18_Print Endpoint
   Log    ${ENDPOINT}

TC19_Age Validation
    Check Age    ${USER['age']}


TC20_Call Custom Keyword
   Manage Profile    Alice    25    Hiking    Reading    city=NY




