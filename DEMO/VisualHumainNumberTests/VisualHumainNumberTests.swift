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
        println("----")
        var numberString = "53430345.83"
                
        var vhn :  VisualHumainNumber = VisualHumainNumber(string:numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComaRounded))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "430345"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "4303453345"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "4303453"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "8532567"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "853256"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "85325"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")
        numberString = "8532"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(" ")
        numberString = "853"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(" ")
        numberString = "85"
        vhn.setNumber(string: numberString)
        println(numberString)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))
        println(" ")

        vhn.setNumber(long: 321445)
        println(321445)
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithSpace))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SeparatorHundredWithComa))
        println(vhn.getVisualHumainNumbers(notation: VisualHumainNumberNotation.SimpleHumain))

        println("----")
        
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
