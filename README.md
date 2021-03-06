
[![Build Status](https://travis-ci.org/Armanoide/VisualHumainNumber.svg?branch=master)](https://travis-ci.org/Armanoide/VisualHumainNumber)

# VisualHumainNumber
Display big number with abbreviation 

Note: Build on Xcode 8, swift 3

## Install

use ~>"0.2.X" for swift3

use ~>"0.1.X" for swift2

use ~>"0.0.X" for swift1.2


To use this vendor add files VisualHumainNumber.swift to your Project or add pod 'VisualHumainNumber', to your podfile

![alt tag](https://github.com/Armanoide/VisualHumainNumber/blob/master/demo.png)

## Basic
     
        let vhn = VisualHumainNumber(string: "53430345.83", separator: Character( " " ) )
        
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundred)) 
        // => 53 430 345
        vhn.setSeparator( Character( "," ) )
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundred)) 
        // =>  53,430,345
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain)) 
        // => 53M
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredRounded))
        // => 53,430,345.83
        print(vhn.isNegative)
        // => fasle
        
## Feature

- [x]  Negative number