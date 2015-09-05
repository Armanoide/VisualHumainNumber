//
//  File.swift
//  VisualHumainNumber
//
//  Created by Norbert Billa on 04/09/2015.
//  Copyright (c) 2015 norbert-billa. All rights reserved.
//

import Foundation


/// These constants specify predefined number format visual styles.
/// These constants are used by the getVisualHumainNumbers func.
///
/// Indentation will create a code block, handy for example usage:
///
///
/// 1. **SimpleHumain**
///   (ex: 4532456) => 4M
/// 2. **SeparatorHundredWithComaRounded**
///   (ex: 4532456.43) => 4,532,456.43
/// 3. **SeparatorHundredWithSpaceRounded**
///   (ex: 4532456.43) => 4 532 456.43
/// 4. **SeparatorHundredWithComa**
///   (ex: 4532456) => 4,532,456
/// 5. **SeparatorHundredWithComa**
///   (ex: 4532456) => 4,532,456
///
///
/// :returns: VisualHumainNumberNotation.
enum VisualHumainNumberNotation : Int {
    case SimpleHumain
    case SeparatorHundredWithSpace
    case SeparatorHundredWithComa
    case SeparatorHundredWithSpaceRounded
    case SeparatorHundredWithComaRounded
}

class VisualHumainNumber {
    
    private var visualHumainNumbersDecimal : Double = 0
    private var visualHumainNumbersInteger : Int64 = 0
    
    init(string :String)    { self.setNumber(string: string) }
    
    init(double: Double)    { self.setNumber(double: double) }
    
    init(long: Int64)       { self.setNumber(long: long) }
    
    func setNumber(#string : String) ->  VisualHumainNumber {
        self.visualHumainNumbersDecimal =  VisualHumainNumber.trimAllNumberToDecimal(string)
        self.visualHumainNumbersInteger =  VisualHumainNumber.trimAllNumberToInt(string)
        return self
    }
    func setNumber(#double: Double) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = double
        self.visualHumainNumbersInteger = Int64(floor(double))
        return self
    }
    
    func setNumber(#long: Int64) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = Double(long)
        self.visualHumainNumbersInteger = long
        return self
    }
    
    private func separator(#notation : VisualHumainNumberNotation, lenghtForSeparator : Int, separator : Character) -> String {
        var s  = ""
        var r = ""
        var __all_count = 0
        var __start = (notation == .SeparatorHundredWithComaRounded || notation == .SeparatorHundredWithSpaceRounded) ? false : true
        var __true_length_decimal = (notation == .SeparatorHundredWithComaRounded || notation == .SeparatorHundredWithSpaceRounded) ? 3 : 0
        
        switch notation {
        case .SeparatorHundredWithComaRounded, .SeparatorHundredWithSpaceRounded :
            s = VisualHumainNumber.inverseString(String(stringInterpolationSegment: self.visualHumainNumbersDecimal))
            break
        default:
            s = VisualHumainNumber.inverseString(String(stringInterpolationSegment: self.visualHumainNumbersInteger))
            break
            
        }
        
        
        for c in s {
            if __start == true {
                if __all_count % lenghtForSeparator == 0 && __all_count < count(s) - __true_length_decimal && __all_count > 0 {
                    r.append(separator)
                }
                __all_count++
            } else if c == "." {
                __start = true
            }
            r.append(c)
        }
        
        return VisualHumainNumber.inverseString(r)
    }
    
    private func simpleHumain(#notation : VisualHumainNumberNotation) -> String {
        
        let __ = self.visualHumainNumbersDecimal
        
        var r : Double = 0
        
        var type = 0
        
        
        if __ < 1000 {
            r =  __
        }
        else if __ <  1000000 {
            r = __ / 1000
            type = 1
        } else if  __ < 1000000000{
            r = __ / 1000000
            type = 2
        } else {
            r = __ / 1000000000
            type = 3
        }
        
        var rs = notation == .SimpleHumain ? "\(Int(r))" : "\(r)"
        let __arr = VisualHumainNumber(string: rs)
        return __arr.getVisualHumainNumbers(notation: notation == .SimpleHumain ?
            .SeparatorHundredWithSpace : .SeparatorHundredWithSpaceRounded) + (type == 1 ? "k" : (type == 2 ? "M" : (type == 3 ? "B" : "")))
    }
    
    
    
    /// Function getVisualHumainNumbers transform big number into a visual number for humain
    ///
    ///
    ///
    /// :param: VisualHumainNumberNotation use to determine the fomat to display number.
    /// :returns: String.
    func getVisualHumainNumbers(#notation : VisualHumainNumberNotation) -> String {
        
        if self.visualHumainNumbersDecimal == 0 { return "0" }
        
        switch notation {
        case .SimpleHumain:
            return self.simpleHumain(notation: notation)
        case .SeparatorHundredWithComa, .SeparatorHundredWithComaRounded:
            return self.separator(notation: notation, lenghtForSeparator: 3, separator: Character(","))
        case .SeparatorHundredWithSpace, .SeparatorHundredWithSpaceRounded:
            return self.separator(notation: notation, lenghtForSeparator: 3, separator: Character(" "))
        }
    }
    
    
    /// Function inverse order of a string, the 1 become last and last the frist.
    ///
    ///
    ///
    /// :param: String The string to reverse order.
    /// :returns: String.
    class func inverseString (string :String) -> String {
        
        var s = ""
        for c in string {
            s = "\(c)" + s
        }
        return s
    }
    
    /// Determine if the Character is a number.
    ///
    ///
    ///
    /// :param: Character
    /// :returns: Bool.
    class func isCharacterNumber(c: Character) -> Bool {
        switch String(c) {
        case "0", "1", "2", "3", "4", "5", "6", "6", "7", "8", "9" : return true
        default: return false
        }
    }
    
    /// Determine if the Character is a marker of decimal.
    ///
    ///
    ///
    /// :param: Character
    /// :returns: Bool.
    class func isCharacterMarkerDecimal(c : Character) -> Bool {
        switch String(c) {
        case ",", "." : return true
        default: return false
        }
    }
    
    /// Function collect all number found in the string and cast to double
    ///
    ///
    ///
    /// :param: String
    /// :returns: Bool.
    class func trimAllNumberToDecimal(string : String) -> Double {
        var numberString : String = ""
        for c in string {
            if VisualHumainNumber.isCharacterNumber(c) == true {
                numberString.append(c)
            }
            else if  VisualHumainNumber.isCharacterMarkerDecimal(c) == true  {
                numberString.append(Character("."))
            }
        }
        return NSNumberFormatter().numberFromString(numberString)!.doubleValue
    }
    
    /// Function collect all number found in the string and cast to interger
    ///
    ///
    ///
    /// :param: String
    /// :returns: Bool.
    class func trimAllNumberToInt(string : String) -> Int64 {
        var numberString : String = ""
        for c in string {
            if VisualHumainNumber.isCharacterNumber(c) == true {
                numberString.append(c)
            }
            else if  VisualHumainNumber.isCharacterMarkerDecimal(c) == true  {
                numberString.append(Character("."))
            }
        }
        return NSNumberFormatter().numberFromString(numberString)!.longLongValue
    }
    
}