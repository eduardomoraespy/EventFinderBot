*** Settings ***
Resource    resources/main.resource


*** Variables ***
${status}    FAIL
${list_link} 

*** Tasks ***
Open Browser Generic
    [Documentation]   Task responsible for opening the browser to the portal
    ${status}    ${browser_return}    Run Keyword And Ignore Error    Open Browser Used   ${eventbrite.home}
    IF    "${status}" == "PASS"
        Log    Success    level=INFO
        Set Next Task    Access All Events
    ELSE
        Log    Error open Browser    level=ERROR
    END

Access All Events
    [Documentation]    Task responsible for getting the link to see all events
    ${status}    ${return_acess_all}    Run Keyword And Ignore Error    Acess All
    IF    "${status}" == "PASS"
        Log    Success    level=INFO
        Set Suite Variable    ${list_link}    ${return_acess_all}
        Set Next Task    Insert Links Db
    ELSE
        Log    Error open Browser    level=ERROR
    END


Insert Links Db
    [Documentation]    Task responsible for inserting records in the Database
    ${status}    ${return_insert_links}    Run Keyword And Ignore Error    Inserir Link    ${list_link[1]}
    Log    ${list_link[1]}
    IF    "${status}" == "PASS"
        Log    Success    level=INFO
        Set Next Task    End Execution
    ELSE
        Log    Error Insert Links Db   level=ERROR
    END

End Execution
    [Documentation]    Task responsible for closing browser
    Close All Browsers
    Log     browser closed    level=INFO