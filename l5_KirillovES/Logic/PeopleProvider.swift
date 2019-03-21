//
//  PeopleProvider.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

import Foundation

protocol PeopleProvider {
    func fetchPeople(completion: @escaping ([Person]) -> Void)
}

struct PeopleFetcher: PeopleProvider {
    
    let address = "https://jsonplaceholder.typicode.com/users"
    let loader: Loader = URLSessionLoader()
    
    func fetchPeople(completion: @escaping ([Person]) -> Void) {
        guard let url = URL(string: address) else { return }
        
        loader.execute(url) { data in
            guard let data = data else { return }
            
            do {
                let people = try JSONDecoder().decode([Person].self, from: data)
                completion(people)
            } catch {
                print(error)
                completion([])
            }
        }
    }
    
}
