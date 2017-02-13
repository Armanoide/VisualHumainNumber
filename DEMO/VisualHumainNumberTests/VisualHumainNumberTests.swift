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
        continueAfterFailure = true;
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStringNumber53430345_83() {
        let vhn: VisualHumainNumber = VisualHumainNumber(string: "53430345.83", separator: ",");
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundredRounded) == "53,430,345.83");
        vhn.separator = " "
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "53 430 345" );
        //XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "53,430,345" );
        vhn.separator = "."
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .simpleHumain) == "53.4M" );
        vhn.separator = "😂"
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "53😂430😂345" );

    }

    func testStringNumber430345() {
        let vhn: VisualHumainNumber = VisualHumainNumber(string: "430345");
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundredRounded) == "430,345.0");
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "430,345" );
        vhn.separator = "!";
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "430!345" );
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .simpleHumain) == "430k" );
    }

    func testStringNumber4303453345() {
        let vhn: VisualHumainNumber = VisualHumainNumber(string: "4303453345");
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundredRounded) == "4,303,453,345.0");
        vhn.separator = " ";
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "4 303 453 345" );
        vhn.separator = ",";
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "4,303,453,345" );
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .simpleHumain) == "4.3B" );
    }

    func testIntNumber321445() {
        let vhn: VisualHumainNumber = VisualHumainNumber(long: 321445);
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundredRounded) == "321,445.0");
        vhn.separator = " ";
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "321 445" );
        vhn.separator = "~";
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .separatorHundred) == "321~445" );
        XCTAssertTrue( vhn.getVisualHumainNumbers(notation: .simpleHumain) == "321k" );
    }


   }
