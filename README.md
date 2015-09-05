# VisualHumainNumber
Display big number with abbreviation 

Note: Build on Xcode 6, swift 1.2
All method are asynchronous.

## Install

To use this vendor add files VisualHumainNumber.swift to your Project or add pod 'VisualHumainNumber', to your podfile

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

        
