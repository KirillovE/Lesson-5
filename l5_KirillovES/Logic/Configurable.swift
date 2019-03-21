//
//  Configurable.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

protocol Configurable {
    associatedtype Model
    func configure(with viewModel: Model)
}
