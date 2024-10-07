*** Settings ***
Resource          ../page_objects/user_api.robot
Resource          ../resources/keywords.robot

*** Variables ***
${USER_NAME}       {"username": "SadeshM"}
${NEW_USER}        {"id": 15, "username": "SadeshM", "firstName": "Sadesh", "lastName": "M", "email": "sadeshm@example.com", "password": "password123", "phone": "1234567890", "userStatus": 1}
${UPDATED_USER}    {"id": 15, "username": "SadeshM", "firstName": "Sadesh", "lastName": "M", "email": "sadeshm@example.com", "password": "password123", "phone": "1234567890", "userStatus": 0}

*** Test Cases ***

Add a New User
    [Documentation]    Adds a new User to the store and verifies the response.
     Log    ${BASE_URL}    # Log the base URL to ensure it's set correctly
    ${response}=    Add New User    ${NEW_USER}
    Validate Status Code    ${response}    200
    Log Response Body       ${response}

Get User By Name
    [Documentation]    Retrieves the User details by User Name and verifies the response.
    ${response}=    Get User By Name    ${USER_NAME}
    Validate Status Code    ${response}    200
    Log Response Body       ${response}
    Should Contain          ${response.json()['username']}    SadeshM

Update User Information
    [Documentation]    Updates the User's status and verifies the response.
    ${response}=    Update User    ${UPDATED_USER}
    Validate Status Code    ${response}    200
    Log Response Body       ${response}

Delete User By User Name
    [Documentation]    Deletes the pet and verifies the response.
    ${response}=    Delete User    ${USER_NAME}
    Validate Status Code    ${response}    200
