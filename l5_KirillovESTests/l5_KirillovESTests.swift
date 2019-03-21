//
//  l5_KirillovESTests.swift
//  l5_KirillovESTests
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

import XCTest
@testable import l5_KirillovES

class PersonTests: XCTestCase {

    let url = URL(string: "https://ya.ru")!
    var loader: Loader?
    let json = """
    [
        {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "city": "Gwenborough",
                "zipcode": "92998-3874",
                "geo": {
                    "lat": "-37.3159",
                    "lng": "81.1496"
                }
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
                "name": "Romaguera-Crona",
                "catchPhrase": "Multi-layered client-server neural-net",
                "bs": "harness real-time e-markets"
            }
        }
    ]
    """.data(using: .utf8)
    
    override func setUp() {
        loader = URLSessionLoader()
    }

    func testDecoding() {
        XCTAssertNoThrow(try JSONDecoder().decode([Person].self, from: json!))
    }
    
    func testLoading() {
        loader?.execute(url) { data in
            XCTAssertNotNil(data)
        }
    }

}
