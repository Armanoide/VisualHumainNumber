# VisualHumainNumber
Display big number with abbreviation 

Note: Build on Xcode 8, swift 3

## Install

use ~>"0.2.X" for swift3

use ~>"0.1.X" for swift2

use ~>"0.0.X" for swift1.2


To use this vendor add files VisualHumainNumber.swift to your Project or add pod 'VisualHumainNumber', to your podfile

![alt tag](https://github.com/Armanoide/VisualHumainNumber/blob/master/demo.png =640x480)

## Basic
     
        let vhn = VisualHumainNumber(string: "53430345.83")
        
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace)) 
        // => 53 430 345
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa)) 
        // =>  53,430,345
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain)) 
        // => 53M
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComaRounded))
        // => 53,430,345.83

        
