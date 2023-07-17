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
/// - returns: VisualHumainNumberNotation.
@objc public enum VisualHumainNumberNotation : Int {
    case simpleHumain
    case separatorHundredWithSpace
    case separatorHundredWithComa
    case separatorHundredWithSpaceRounded
    case separatorHundredWithComaRounded
}

@objc public class VisualHumainNumber: NSObject {
    
    fileprivate var visualHumainNumbersDecimal : Double = 0
    fileprivate var visualHumainNumbersInteger : Int64 = 0
    
   public init(string :String)    { super.init ()
    self.setNumber(string: string)}
    
   public init(double: Double)    { super.init ()
    self.setNumber(double: double) }
    
   public init(long: Int64)       { super.init ()
    self.setNumber(long: long) }
    
   open func setNumber(string : String) ->  VisualHumainNumber {
        self.visualHumainNumbersDecimal =  VisualHumainNumber.trimAllNumberToDecimal(string)
        self.visualHumainNumbersInteger =  VisualHumainNumber.trimAllNumberToInt(string)
        return self
    }
    open func setNumber(double: Double) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = double
        self.visualHumainNumbersInteger = Int64(floor(double))
        return self
    }
    
    open func setNumber(long: Int64) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = Double(long)
        self.visualHumainNumbersInteger = long
        return self
    }
    
    fileprivate func separator(notation : VisualHumainNumberNotation, lenghtForSeparator : Int, separator : Character) -> String {
        var s  = ""
        var r = ""
        var __all_count = 0
        var __start = (notation == .separatorHundredWithComaRounded || notation == .separatorHundredWithSpaceRounded) ? false : true
        let __true_length_decimal = (notation == .separatorHundredWithComaRounded || notation == .separatorHundredWithSpaceRounded) ? 3 : 0
        
        switch notation {
        case .separatorHundredWithComaRounded, .separatorHundredWithSpaceRounded :
            s = VisualHumainNumber.inverseString(String(self.visualHumainNumbersDecimal))
            break
        default:
            s = VisualHumainNumber.inverseString(String(self.visualHumainNumbersInteger))
            break
            
        }
        
        
        for c in s {
            if __start == true {
                if __all_count % lenghtForSeparator == 0 && __all_count < s.count - __true_length_decimal && __all_count > 0 {
                    r.append(separator)
                }
                __all_count += 1
            } else if c == "." {
                __start = true
            }
            r.append(c)
        }
        
        return VisualHumainNumber.inverseString(r)
    }
    
    fileprivate func simpleHumain(notation : VisualHumainNumberNotation) -> String {
        
        let __ = self.visualHumainNumbersDecimal
        
        var r : Double = 0
        var finalNotation : VisualHumainNumberNotation = .separatorHundredWithComaRounded
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
        
        var rs  = "\(floor(r * 10) / 10)"
        if (floor(r * 10) / 10).truncatingRemainder(dividingBy: 1) == 0 {  rs = "\(Int64(floor(r)))" ;  finalNotation = .separatorHundredWithComa }
        let __rs_i = VisualHumainNumber.getDoubleFromString(rs) ;  if __rs_i >= 100 { rs = "\(Int64(floor(__rs_i)))" ; finalNotation = .separatorHundredWithComa }
        let __arr = VisualHumainNumber(string: rs)
        return __arr.getVisualHumainNumbers(notation: finalNotation) + (type == 1 ? "k" : (type == 2 ? "M" : (type == 3 ? "B" : "")))
    }
    
    /// Function getVisualHumainNumbers transform big number into a visual number for humain
    ///
    ///
    ///
    /// - parameter VisualHumainNumberNotation: use to determine the fomat to display number.
    /// - returns: String.
    open func getVisualHumainNumbers(notation : VisualHumainNumberNotation) -> String {
        
        if self.visualHumainNumbersDecimal == 0 { return "0" }
        
        switch notation {
        case .simpleHumain:
            return self.simpleHumain(notation: notation)
        case .separatorHundredWithComa, .separatorHundredWithComaRounded:
            return self.separator(notation: notation, lenghtForSeparator: 3, separator: Character(","))
        case .separatorHundredWithSpace, .separatorHundredWithSpaceRounded:
            return self.separator(notation: notation, lenghtForSeparator: 3, separator: Character(" "))
        }
    }
    
    
    /// Function inverse order of a string, the 1 become last and last the frist.
    ///
    ///
    ///
    /// - parameter String: The string to reverse order.
    /// - returns: String.
    open class func inverseString (_ string :String) -> String {
        
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
    /// - parameter Character:
    /// - returns: Bool.
    open class func isCharacterNumber(_ c: Character) -> Bool {
        switch String(c) {
        case "0", "1", "2", "3", "4", "5", "6", "6", "7", "8", "9" : return true
        default: return false
        }
    }
    
    /// Determine if the Character is a marker of decimal.
    ///
    ///
    ///
    /// - parameter Character:
    /// - returns: Bool.
    open class func isCharacterMarkerDecimal(_ c : Character) -> Bool {
        switch String(c) {
        case ",", "." : return true
        default: return false
        }
    }
    
    fileprivate class func getCh(_ c : Character) -> Int {
        switch c {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        default: return 0
        }
    }
    
    
    fileprivate class func getDoubleFromString(_ numberString: String) -> Double {
        var number : Double = 0
        var mul : Double = 1
        var __P = "UP"
        
        for c in numberString {
            if VisualHumainNumber.isCharacterMarkerDecimal(c) {
                __P = "DOWN"
                mul = 0.1
                
            } else {
                
                if __P == "UP" {
                    
                    number = number * 10 + Double(VisualHumainNumber.getCh(c))
                    
                } else {
                    
                    number = number + Double(VisualHumainNumber.getCh(c)) * mul
                    mul /= 10
                    
                }
            }
        }
        return number
    }
    
    fileprivate class func getIntegerFromString(_ numberString: String) -> Int64 {
        var number : Int64 = 0
        
        for c in numberString {
            
            if VisualHumainNumber.isCharacterMarkerDecimal(c) { break }
            
            number = number * 10 + Int64(VisualHumainNumber.getCh(c))
            
        }
        return number
    }
    
    
    
    /// Function collect all number found in the string and cast to double
    ///
    ///
    ///
    /// - parameter String:
    /// - returns: Bool.
    open class func trimAllNumberToDecimal(_ string : String) -> Double {
        var numberString : String = ""
        for c in string {
            if VisualHumainNumber.isCharacterNumber(c) == true {
                numberString.append(c)
            }
            else if  VisualHumainNumber.isCharacterMarkerDecimal(c) == true  {
                numberString.append(Character(","))
            }
        }
        return self.getDoubleFromString(numberString)
    }
    
    /// Function collect all number found in the string and cast to interger
    ///
    ///
    ///
    /// - parameter String:
    /// - returns: Bool.
    open class func trimAllNumberToInt(_ string : String) -> Int64 {
        var numberString : String = ""
        for c in string {
            if VisualHumainNumber.isCharacterNumber(c) == true {
                numberString.append(c)
            }
            else if  VisualHumainNumber.isCharacterMarkerDecimal(c) == true  {
                numberString.append(Character("."))
            }
        }
        return getIntegerFromString(numberString)
    }
    
}
