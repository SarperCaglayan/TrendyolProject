*** Settings ***
Documentation       This is some basic info about the whole suite
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      ie

*** Test Cases ***
User must sign in to check out
    [Documentation]     This is some basic info about the test
    [Tags]    Smoke
    Begin Web Test
    Search for Products
    Select Product from Search Results
    Add Product to Cart
    Begin Checkout
    End Web Test


*** Keywords ***
Begin Web Test
   Open Browser    about: blank        edge

Search for Products
    Go to             https://www.trendyol.com/

    Input Text        xpath=//input[@data-testid='search-bar-input']    classic polo t-shirts

    #Click Button      id=onetrust-accept-btn-handle
    Click Element      xpath=//img[@data-testid='search-bar-icon']
    wait until page contains    LET'S PERSONALIZE YOUR EXPERIENCE     timeout=5
    Click Button       Reject All
   #Wait Until Page Contains     Classic Polo T Shirts


Select Product from Search Results

    Click Element        xpath=//div[@class='brand'][contains(.,'Altınyıldız Classics')]
    Wait Until Page Contains     ALTINYILDIZ CLASSICS T-Shirt - Dark blue -

Add Product to Cart
     Click Button       xpath=//button[@class='default']
     Wait Until Page Contains     ADDED TO BAG

Begin Checkout
     Click Element         xpath=//img[@src='https://cdn.dsmcdn.com/sfint/production/icons/web-header-cart_1681714488203.png']
     Wait Until Page Contains     My bag (1)
     Page Should Contain Element  xpath=//p[contains(.,'CHECKOUT')]

End Web Test
     Close Browser
