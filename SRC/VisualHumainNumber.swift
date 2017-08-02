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
/// 1. **simpleHumain**
///   (ex: 4532456) => 4M
/// 2. **separatorHundred**
///   (ex: 4532456.43) => 4,532,456.43
/// 3. **separatorHundredRounded**
///   (ex: 4532456.43) => 4 532 456.43
///
///
/// - returns: VisualHumainNumberNotation.
@objc public enum VisualHumainNumberNotation : Int {
    case simpleHumain
    case separatorHundred
    case separatorHundredRounded
}

@objc public class VisualHumainNumber: NSObject {

    fileprivate var visualHumainNumbersDecimal : Double = 0
    fileprivate var visualHumainNumbersInteger : Int64 = 0
    fileprivate var _separator: String =  ","
    fileprivate (set) var isNegative : Bool = false

    var separator: String? {
        get {
            return _separator
        }
        set {
            if let newValue = newValue {
                self._separator = newValue;
            }
        }
    }


    public init(string :String, separator: String? = nil)    {
        super.init ()
        self.separator = separator;
        _ = self.setNumber(string: string)

    }

    public init(double: Double, separator: String? = nil)    {
        super.init ()
        self.separator = separator;
        _ = self.setNumber(double: double)

    }

    public init(long: Int64, separator: String? = nil)       {
        super.init ()
        self.separator = separator;
        _ = self.setNumber(long: long)

    }

    open func setNumber(string : String) ->  VisualHumainNumber {
        self.visualHumainNumbersDecimal =  VisualHumainNumber.trimAllNumberToDecimal(string)
        self.visualHumainNumbersInteger =  VisualHumainNumber.trimAllNumberToInt(string)
        checkIfIsNegative()
        return self

    }
    open func setNumber(double: Double) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = double
        self.visualHumainNumbersInteger = Int64(floor(double))
        checkIfIsNegative()
        return self

    }

    open func setNumber(long: Int64) -> VisualHumainNumber {
        self.visualHumainNumbersDecimal = Double(long)
        self.visualHumainNumbersInteger = long
        checkIfIsNegative()
        return self
    }

    fileprivate func checkIfIsNegative() {
        if self.visualHumainNumbersDecimal < 0 || self.visualHumainNumbersInteger < 0 {
            self.isNegative = true
        }
    }


    fileprivate func appendSeparator(notation : VisualHumainNumberNotation, lenghtForSeparator : Int, separator : String) -> String {
        var s  = ""
        var result = ""
        var __all_count = 0

        // for resverse wait to start after coma like 04.432, start apply stuff after 04.
        var __start = true;
        var __true_length_decimal = 0;

        if notation == .separatorHundredRounded {
            __start = false;
            __true_length_decimal = 3;

        }
        /*var __start = (notation == .separatorHundredRounded) ? false : true
         let __true_length_decimal = (notation == .separatorHundredRounded) ? 3 : 0*/

        switch notation {
        case .separatorHundredRounded :
            s = VisualHumainNumber.inverseString(String(stringInterpolationSegment: self.visualHumainNumbersDecimal))
            break
        default:
            s = VisualHumainNumber.inverseString(String(stringInterpolationSegment: self.visualHumainNumbersInteger))
            break

        }

        if self.isNegative {
            let endIndex = s.index(s.endIndex, offsetBy: -1)
            let lastCharacter = s.substring(from: endIndex)
            if lastCharacter == "-" {
                s = s.substring(to: endIndex)
            }
        }

        for c in s.characters {
            if __start == true {
                if __all_count % lenghtForSeparator == 0 && __all_count <= s.characters.count - __true_length_decimal && __all_count > 0 {
                    result.append(separator)
                }
                __all_count += 1
            } else if c == "." {
                __start = true
            }
            result.append(c)
        }

        if self.isNegative {
            result.append("-")
        }

        return VisualHumainNumber.inverseString(result)
    }

    fileprivate func simpleHumain(notation : VisualHumainNumberNotation) -> String {

        var __ = self.visualHumainNumbersDecimal
        var r : Double = 0
        var finalNotation : VisualHumainNumberNotation = .separatorHundredRounded
        var type = 0

        // check if is negative
        if self.isNegative {
            __ = __ * -1
        }

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
        if (floor(r * 10) / 10).truncatingRemainder(dividingBy: 1) == 0 {  rs = "\(Int64(floor(r)))" ;  finalNotation = .separatorHundred }
        let __rs_i = VisualHumainNumber.getDoubleFromString(rs) ;  if __rs_i >= 100 { rs = "\(Int64(floor(__rs_i)))" ; finalNotation = .separatorHundred }
        let __arr = VisualHumainNumber(string: rs)
        var result = __arr.getVisualHumainNumbers(notation: finalNotation) + (type == 1 ? "k" : (type == 2 ? "M" : (type == 3 ? "B" : "")))

        if isNegative {
            result = "-" + result
        }
        return result
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
        case .separatorHundred, .separatorHundredRounded:
            return self.appendSeparator(notation: notation, lenghtForSeparator: 3, separator: self.separator!)
        }
    }


    /// Function inverse order of a string, the 1 become last and last the first.
    ///
    ///
    ///
    /// - parameter String: The string to reverse order.
    /// - returns: String.
    open class func inverseString (_ string :String) -> String {
        var s = ""
        for c in string.characters {
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

        for c in numberString.characters {
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

        for c in numberString.characters {

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
        var isNegative = false
        for c in string.characters {
            if VisualHumainNumber.isCharacterNumber(c) == true {
                numberString.append(c)
            }
            else if  VisualHumainNumber.isCharacterMarkerDecimal(c) == true  {
                numberString.append(Character(","))
            } else if c == "-" && numberString.isEmpty {
                isNegative = !isNegative
            }
        }

        if isNegative {
            return self.getDoubleFromString(numberString) * -1
        } else {
            return self.getDoubleFromString(numberString)
        }

    }

    /// Function collect all number found in the string and cast to interger
    ///
    ///
    ///
    /// - parameter String:
    /// - returns: Bool.
    open class func trimAllNumberToInt(_ string : String) -> Int64 {
        var numberString : String = ""
        for c in string.characters {
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
