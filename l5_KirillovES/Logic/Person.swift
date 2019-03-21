//
//  Person.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

struct Person: Decodable {
    let name: String
    let email: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
