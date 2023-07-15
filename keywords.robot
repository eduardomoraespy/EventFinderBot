*** Settings ***
Resource    ${ROOT}/resources/main.resource


*** Keywords ***
Open Browser Used
    [Arguments]    ${url}
    ${status}    ${browser_return}    Run Keyword And Ignore Error    Open Available Browser    ${url}    maximized=${TRUE}
    ${element_visible}    Wait Until Element Is Visible    ${eventbrite.input_populan_in}    timeout=20s
    log    ${element_visible}
    IF    "${status}" == "PASS"
        Set Suite Variable    ${return_bool}    ${TRUE}
    ELSE
        Set Suite Variable    ${return_bool}    ${FALSE}
    END

    RETURN    ${return_bool}

Acess All
    Input Text    ${eventbrite.input_populan_in}    Goiânia
    Sleep    1s
    Click Element    ${eventbrite.tab_all}
    Sleep    1s
    Wait Until Element Is Visible    ${eventbrite.btn_view_more}    timeout=20
    Click Element    ${eventbrite.btn_view_more}
    Wait Until Element Is Visible    ${eventbrite.link}    timeout=20
    ${elements_a}    Get WebElement    ${eventbrite.link}
    Sleep    1s
    ${nova_lista}    Create List
    FOR    ${i}    IN    ${elements_a}
        ${link_tag_a}    Get element Attribute    ${i}    href
        Append To List    ${nova_lista}    ${link_tag_a}
    END
    RETURN    ${TRUE}    ${nova_lista}
