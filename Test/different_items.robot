*** Settings ***
Library     SeleniumLibrary
Library     Collections


*** Variables ***
${URL}              https://contextures.com/xlsampledata01.html#data
${BROWSER}          Chrome
@{ITEMS}   
@{UNITS}
@{TOTAL}         

*** Test Cases ***
SampleDataTable
    Open Browser            https://contextures.com/xlsampledata01.html#data         chrome
    Maximize Browser Window
    Sleep       2s
    #Count of rows including header row = 44
    ${number_of_rows}=        Get Element Count       xpath://div[1]/table[14]/tbody/tr
    Log To Console    ${number_of_rows}

    Wait Until Page Contains Element        xpath://table[14]/tbody/tr[1]/td[1]
    
    FOR    ${INDEX}    IN RANGE    2   ${number_of_rows+1}  # to include last row using +1
        ${items_in_table}    Get Text         xpath://table[14]/tbody/tr[${INDEX}]/td[4]
        Append To List  ${ITEMS}    ${items_in_table} 
        Log To Console    ${ITEMS}
     END
     FOR    ${INDEX}    IN RANGE    2   ${number_of_rows+1}
        ${units_in_table}    Get Text         xpath://table[14]/tbody/tr[${INDEX}]/td[5]
        Append To List  ${UNITS}    ${units_in_table} 
        Log To Console    ${UNITS}
     END 
     FOR    ${INDEX}    IN RANGE    2   ${number_of_rows+1}
        ${total_in_table}    Get Text         xpath://table[14]/tbody/tr[${INDEX}]/td[7]
        Append To List  ${TOTAL}    ${total_in_table} 
        Log To Console    ${TOTAL}
     END 
     
    #Answering Questions
    #How many different items are there (binder/pencil etc.) ?
    #Is there an item with less than 5 units?
    #Is there a pencil with less than 5 units?
    #What is the most expensive item on the list?
 

    #FOR    ${item}    IN    @{ITEMS}
       # Run Keyword And Continue On Failure    Should Contain    ${items_in_table}    ${item}
    #END
    Close Browser
