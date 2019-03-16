//
//  LFBR_SwiftLibTests.swift
//  LFBR.SwiftLibTests
//
//  Created by Luis Fernando Bustos Ramírez on 3/15/19.
//  Copyright © 2019 Gastando Tenis. All rights reserved.
//

import XCTest
@testable import LFBR_SwiftLib

class LFBR_SwiftLibTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testREGEX(){
        XCTAssert("lufe.bura@gmail.com".isEmail(), "MAIL IS VALID")
        XCTAssert(!"lufe.buragmail.com".isEmail(), "DONT HAVE @")
        XCTAssert(!"lufe.bura@gmail".isEmail(), "DONT HAVE .COM")
        
        XCTAssert("3.141519".isNumber(), "THIS IS A NUMBER")
        XCTAssert(!"3E23SCS".isNumber(), "IS NOT A NUMBER")
        
        XCTAssertEqual("SASDA".int, 0)
        XCTAssertEqual("3.1".int, 3)
        XCTAssertEqual("3.1415".toFloat(), 3.1415)
    }
    
    func testCommonCrypto(){
        do {
            let sourceData = "AES256".data(using: .utf8)!
            let password = "password"
            let salt = AES256Crypter.randomSalt()
            let iv = AES256Crypter.randomIv()
            let key = try AES256Crypter.createKey(password: password.data(using: .utf8)!, salt: salt)
            let aes = try AES256Crypter(key: key, iv: iv)
            let encryptedData = try aes.encrypt(sourceData)
            let decryptedData = try aes.decrypt(encryptedData)
            
            
            print("Encrypted hex string: \(encryptedData.base64EncodedString())")
            print("Decrypted hex string: \(decryptedData.base64EncodedString())")
            
            XCTAssertEqual(decryptedData, sourceData)
            
        } catch {
            print("Failed")
            print(error)
            XCTFail()
        }
    }

}
