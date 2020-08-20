*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
#Test Teardown  EntryInLog

Default Tags   GlobalTraining

*** Variables ***
#${AbsoluteTestSuiteLogPath}      C:/Users/%{username}/Desktop/testsuitelog.txt 

${URL}                https://opensource-demo.orangehrmlive.com/       #déclaration d'un     SCALAR
@{CREDENTIALS}                   admin            admin123                        #déclaration d'une    LIST
&{MYDICTIONNARY}                 WORD1=premier    WORD2=deuxieme                  #déclaration d'un     DICTIONNARY

*** Test Cases ***
TestHelloWorld
    Log               Hello world !  

MySecondTest
    [Tags]            Training2
    Log               My second test !

MyThirdTest
    [Tags]            Training3
    Log               My third test !

MyFourthTest
    [Tags]            Training4
    Log               My fourth test !

1stSeleniumTest
    Open Browser      https://www.google.fr/    chrome
    Set Browser Implicit Wait                   1
    Input Text        name=q                    orange
    Press Keys        name=q                    RETURN
    Close Browser
    Log               1st selenium complete

TesLoginSelenium
   
    Open Browser                ${URL}                                     chrome
    Set Browser Implicit Wait   1    
    Input Text                  id=txtUsername                             ${CREDENTIALS}[0]
    Input Password              id=txtPassword                             ${CREDENTIALS}[1]
    Click Button                id=btnLogin
    Close Browser 
    #${segmentCo}=    Get Text   xpath://html/body/center/table[2]/tbody/tr/td/table[1]/tbody/tr[6]/td[8]    
    Log                         Utilisation de 2 variables d'environnement: Ce test a été exécuté par %{username} sur %{os}  #utilisation de 2 variables d'environnement
  


*** Keywords ***
#EntryInLog
#    ${time}=          Get Time
#    Append To File    ${AbsoluteTestSuiteLogPath}    ${time} | 
#    Append To File    ${AbsoluteTestSuiteLogPath}    ${TEST NAME}=>${TEST STATUS}\r