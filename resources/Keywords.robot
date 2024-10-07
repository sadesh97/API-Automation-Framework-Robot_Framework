*** Keywords ***
Validate Status Code
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}

Log Response Body
    [Arguments]    ${response}
    Log    ${response.json()}
