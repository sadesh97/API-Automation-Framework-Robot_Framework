*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}    https://petstore.swagger.io/v2
${HEADERS}     {"Content-Type": "application/json", "accept": "application/json"}

*** Keywords ***

Get User By Name
    [Arguments]    ${user_name}

    # Convert JSON string to a dictionary
    ${user_name_dict}=    Evaluate    json.loads('${user_name}')    modules=json

    # Create session with base URL
    Create Session    petstore    ${BASE_URL}    headers=${HEADERS}

    # GET request
    ${response}=    GET On Session   petstore  /user/${user_name_dict['username']}  

    #Log responses  
    Log    ${response.json()}
    Return From Keyword    ${response}

Add New User
    [Arguments]    ${user_data}

    # Convert JSON string to a dictionary
    ${user_data_dict}=    Evaluate    json.loads('${user_data}')    modules=json

    # Create session with base URL
    Create Session    petstore    ${BASE_URL}    headers=${HEADERS}

    # POST request using json payload
    ${response}=    POST On Session   petstore   /user    json=${user_data_dict}
    
    #Log responses
    Log    ${response.json()}
    Return From Keyword    ${response}

Update User
    [Arguments]    ${update_user_data}

    # Convert JSON string to a dictionary
    ${update_user_data_dict}=    Evaluate    json.loads('${update_user_data}')    modules=json

    # Create session with base URL
    Create Session    petstore    ${BASE_URL}     headers=${HEADERS}

    # PUT request using json payload
    ${response}=    PUT On Session   petstore    /user/${update_user_data_dict['username']}    json=${update_user_data_dict}   

    #Log responses
    Log    ${response.json()}
    Return From Keyword    ${response}

Delete User
    [Arguments]    ${user_name}

    # Convert JSON string to a dictionary
    ${user_name_dict}=    Evaluate    json.loads('${user_name}')    modules=json

    # Create session with base URL
    Create Session    petstore    ${BASE_URL}    headers=${HEADERS}

    # DELETE request using json payload
    ${response}=    DELETE On Session   petstore    /user/${user_name_dict['username']}   
    
    #Log responses
    Log    ${response.status_code}
    Return From Keyword    ${response}
