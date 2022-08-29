# TestApproach

This document describes the test approach for the 'CurrencyHelper' app,
written by Sharif Kandil 29-08-2022. In this test approach some decisions are eleborated and future improvements suggested.

## Functional app description

The app presents a "Hello" label and "Button" at startup
When one clicks the "Button" the "Hello" label will change and display a random currency >100,00 in euro's -> locale (nl_NL) 

## QA Approach
To assure the quality of this app, two layers of QA are implemented. A third layer is described but not implemented (yet) and is added to this test approach for future improvements. 

To run the tests with fastlane, one should use "fastlane test_unit" and "fastlane test_ui". The latter one performes the UI tests on "iPhone 6", "iPhone 12 (15.0)", "iPad Air". These set is chosen because of the range of OS's (iOS 12 - 15) and screen dimensions: iPhone 6, 12 and iPad. 

###1. Unit test
    Within this layer, test on unit level are performed to test app logic. Within this approach all possible currency inputs and output are tested to see if code - especially NSnumber and formatting - is perfroming as expected 

###2. UITest
    Within this layer, tests on UI level are performed. Only a small number of UI test are performed to validate the functionality of the app, since codelogic is covered on unit level. Furthermore, accesibility, and performance checks are performed.

###3. ScreenTest (future enhancement)
    Within this layer screen comparison tests could be implemented to check if elements e.g. not overlap, be out of (scroll)view, be out of focus, be within screen borders etc. This could be performed on unit level with mocked data. Furtermore, locale behaviour text/icons could be checked in this layer.  
    
    
    
