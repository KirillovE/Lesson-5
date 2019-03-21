//
//  URLSessionLoader.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

import UIKit

struct URLSessionLoader: Loader {
    func execute(_ url: URL, completion: @escaping (Data?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let request = URLRequest(url: url)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: request) { data, _, _ in
            completion(data)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        task.resume()
    }
    
}

protocol Loader {
    
    /// Обращается в сеть по указанному запросу
    ///
    /// - Parameters:
    ///   - urlRequest: Запрос для обращения в сеть
    ///   - completion: Результат выполнения запроса
    func execute(_ url: URL, completion: @escaping (Data?) -> Void)
}
