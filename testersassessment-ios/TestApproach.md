# TestApproach

This document describes the test approach for the 'CurrencyHelper' app,
written by Sharif Kandil 08-2022

## Functional app description

The app presents a "Hello" label and "Button" at startup
When one clicks the "Button" the "Hello" label will chang and show a random currency >1.000.000,00 in euro's -> locale (nl_NL) 

## QA Approach
To assure the quality of this app, two layers of QA are implemented:
1. Unit test
Within this layer, test on unit level are performed to test app logic. Within this approach all possible currency inputs and output are tested to see if code - especially NSnumber and formatting - is perfroming as expected 

2. UITest
Within this layer, tests on UI level are performed. Only a small number of UI test are performed to validate the functionality of the app. Furthermore, accesibility, and performance checks are performed.

