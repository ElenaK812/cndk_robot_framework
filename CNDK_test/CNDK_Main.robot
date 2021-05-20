*** Settings ***
Documentation    This is my demo project for Robot Framework. CNDK web site testing. I used in project: Variables, List Variables, Dictionary variables, Keywords, Tags, Test case setup/teardown. Location of elements by "xpath".
Library    SeleniumLibrary    
  
Test Setup          Log  This is test case setup
Test Teardown       Close Browser  

*** Variables ***
@{list_browser}  firefox  chrome  edge  safari   

${JunDev}  20
${SenDev}  30
${Tester}  60

&{JunDevDict}  locator=xpath://input[@name='junior-developer_1_1583400856']   value=20
&{SenDevDict}  locator=xpath://input[@name='senior-developer_2_1583400856']   value=30
&{TesterDict}  locator=xpath://input[@name='tester_5_1583400913']            value=60
 
${Contact_button}  xpath: //button[@class='css-177mhw3-Button'] 

*** Keywords ***
CNDKSolutionsTOPMenu
    Open Browser    http://cngroup.dk  ${list_browser}[1]
    Maximize Browser Window
    Set Browser Implicit Wait    5 
    Mouse Down On Link  xpath://a[@href='/solutions'] 
    Click Link    xpath://a[@href='/solutions'] 
    Wait Until Page Contains    2020 CN Group CZ a.s., All rights reserved.
ClearCalcForm
    Mouse Over      ${JunDevDict.locator} 
    Click Element   ${JunDevDict.locator}
    Press Keys      ${JunDevDict.locator}  BACK_SPACE    
    Mouse Over      ${SenDevDict.locator}
    Click Element   ${SenDevDict.locator}
    Press Keys      ${SenDevDict.locator}  BACK_SPACE
    Mouse Over      ${TesterDict.locator}  
    Click Element   ${TesterDict.locator}   
    Press Keys      ${TesterDict.locator}  BACK_SPACE   
    
CalcData
    Input Text    ${JunDevDict.locator}    ${JunDev} 
    Input Text    ${SenDevDict.locator}  ${SenDevDict.value}
    Input Text    ${TesterDict.locator}    ${Tester}
    Input Text    xpath://input[@id='name']   Elena test
    Input Text    xpath://input[@id='email']  kozlova@cngroup.dk 
       
*** Test Cases ***    
 CNDK main page
    Open Browser    http://cngroup.dk  ${list_browser}[1]
    Set Browser Implicit Wait    3
    Scroll Element Into View  xpath: //a[@class='css-1r0mup5']
    Click Element  xpath://button[@class='css-177mhw3-Button']
    Set Browser Implicit Wait    10
    Wait Until Element Contains    xpath://h2[@class='css-l5bejm-SectionHeading']  Start your project with us
CNDK solutions dedicated team
    [Tags]    solutions
    CNDKSolutionsTOPMenu
    Set Selenium Implicit Wait    10
    Click Link  xpath://a[@href='/solutions/dedicated-teams']
    Go Back  
CNDK solutions integrations-api 
    [Tags]    solutions
    CNDKSolutionsTOPMenu  
    Click Link  xpath://a[@href='/solutions/integrations-api']
    Go Back  
CNDK Decision Workflow
    [Tags]    solutions
    CNDKSolutionsTOPMenu
    Click Link  xpath://a[@href='/solutions/decision-workflow']
    Go Back  
CNDK solutions dedicated team calculator
    CNDKSolutionsTOPMenu
    [Tags]    solutions  calc
    Click Link  xpath://a[@href='/solutions/dedicated-teams']
    Set Browser Implicit Wait    5     
    Click Link    xpath://a[@href="https://www.cngroup.dk/services#b2b-calculator"]
    Scroll Element Into View    xpath://div[@class='css-q3or3u-Box']
    ClearCalcForm 
    CalcData
    Capture Element Screenshot    xpath://div[@class='css-itw3oe-Box']  
CNDK References 
    [Tags]   References 
    Open Browser    http://cngroup.dk  ${list_browser}[1]
    Set Browser Implicit Wait    2  
    Maximize Browser Window
    Mouse Down On Link  xpath://a[@href='/solutions'] 
    Click Link    xpath://a[@href='/references'] 
    Wait Until Page Contains    Need expert advice from our consultants?
    Click Element    xpath://img[@src='/static/media/carousel-next-arrow.85558052.svg']
    Set Browser Implicit Wait    10
CNDK Contact Button
    [Tags]    Contact
    Open Browser    http://cngroup.dk  ${list_browser}[1]
    Set Browser Implicit Wait    2
    Click Button  ${Contact button}     
CNDK About_arrow
    [Tags]     About_us   Articles
    Open Browser    http://cngroup.dk  ${list_browser}[1]
    Maximize Browser Window
    Set Browser Implicit Wait  5
    Click Link    xpath://a[@href='/about-us']
    Scroll Element Into View   xpath://div[@id='history']
    Sleep    3    
    Click Element    //div[@class='css-1ft92b-Box']
    Sleep    3        
    Click Element    //div[@class='css-1ft92b-Box']
    Sleep    3 
    Click Element    //div[@class='css-1ft92b-Box']
    Sleep    3 
    Click Element    //div[@class='css-1ft92b-Box']
    Sleep    3 
    Scroll Element Into View   xpath://h1[@class='css-1ssm3tc-BreakWordText']
    Sleep    3 
         
    
          