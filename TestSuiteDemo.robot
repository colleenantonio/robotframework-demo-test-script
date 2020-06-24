*** Settings ***    # Library for Keywords/Steps
Library    Selenium2Library 
# Default Tags    Demo Testing    # Adding of default tag/name to your project

*** Variables ***    # You can just call the variable name for dyanmic testing so you won't have to type/ change the value over and over again. Just need to update the 'index no.' of the desired value
${url}    https://opensource-demo.orangehrmlive.com/    # Scalar Variable; For single component only
@{credentials}    Admin    admin123    # List Variable; For mulitple/list of components
&{login}    Username=Admin    Password=admin123    # Dictionary Variable
@{browsers}    Chrome    Firefox    Edge    # List Variable; For mulitple/list of components

*** Keywords ***    # You can reuse the steps so you won't need to re-write it over and over again
LoginKW    
    Input Text    id=txtUsername    ${credentials}[0]    # @ sign is deprecated; use $ instead
    Input Text    id=txtPassword    ${login}[Password]    # Call the <variable>+<key>
    Click Button    id=btnLogin
    
*** Test Cases ***
OpenBrowser
    [Tags]    Regression1
    Open Browser    ${url}    ${browsers}[0]
    Sleep    10s    # Set page delay
    Close Browser
    Log To Console    Successfully Opened!
    
Login/Logout
    [Tags]    Regression2
    Open Browser    ${url}    ${browsers}[0]
    Sleep    2s    # Set page delay
    Input Text    id=txtUsername    ${credentials}[0]    # Username = Admin
    Input Text    id=txtPassword    ${login}[Password]    # Password = admin123
    Click Button    id=btnLogin
    # LoginKW
    Sleep    2s    # Set page delay
    Click Element    id=welcome    # if 'Click Button' keyword won't work, try to use 'Click Element' keyword
    Sleep    2s    # Set page delay
    Click Element    xpath=//*[@id="welcome-menu"]/ul/li[2]/a    # Copy xpath in case you cannot locate the element
    Sleep    2s    # Set page delay
    Close Browser
    Log To Console    %{username} ran this test on %{os}. Successful Login and Logout!    # Will log this message on the console results
    
Menu Tabs
    [Tags]    Regression3
    Open Browser    ${url}    ${browsers}[0]
    Sleep    2s    # Set page delay
    Input Text    id=txtUsername    ${credentials}[0]    # Username = Admin
    Input Text    id=txtPassword    ${login}[Password]    # Password = admin123
    Click Button    id=btnLogin
    # LoginKW
    Sleep    2s    # Set page delay
    Click Element    id=menu_admin_viewAdminModule
    Sleep    1s
    Click Element    id=menu_pim_viewPimModule
    Sleep    1s
    Click Element    id=menu_leave_viewLeaveModule
    Sleep    1s
    Click Element    id=menu_time_viewTimeModule
    Sleep    1s
    Click Element    id=menu_recruitment_viewRecruitmentModule
    Sleep    1s
    Click Element    id=menu_dashboard_index
    Sleep    1s
    Click Element    id=menu_directory_viewDirectory
    Sleep    1s
    Click Element    id=menu_maintenance_purgeEmployee
    Sleep    1s
    Click Element    id=menu_buzz_viewBuzz
    Sleep    1s
    Close Browser
    Log To Console    %{username} ran this test on %{os}. Successful displayed all working Menus!    # Will log this message on the console results
                    
    

    
