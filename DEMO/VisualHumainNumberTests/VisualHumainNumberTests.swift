//
//  VisualHumainNumberTests.swift
//  VisualHumainNumberTests
//
//  Created by Norbert Billa on 04/09/2015.
//  Copyright (c) 2015 norbert-billa. All rights reserved.
//

import UIKit
import XCTest

class VisualHumainNumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        print("----")
        
        VisualHumainNumber(string: "987654321.1234567890")
        
        var numberString = "53430345.83"
        let vhn :  VisualHumainNumber = VisualHumainNumber(string:numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComaRounded))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "430345"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "4303453345"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "4303453"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "8532567"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "853256"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "85325"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")
        numberString = "8532"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(" ")
        numberString = "853"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(" ")
        numberString = "85"
        vhn.setNumber(string: numberString)
        print(numberString)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))
        print(" ")

        vhn.setNumber(long: 321445)
        print(321445)
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa))
        print(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain))

        print("----")
        
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
