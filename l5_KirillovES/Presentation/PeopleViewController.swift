//
//  PeopleViewController.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

import UIKit

final class PeopleViewController: UICollectionViewController {
    
    private let reuseID = "PersonCell"
    private let peopleProvider: PeopleProvider = PeopleFetcher()
    private var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPeople()
    }
    
    private func showPeople() {
        peopleProvider.fetchPeople { [weak self] fetchedPeople in
            self?.people = fetchedPeople
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

extension PeopleViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseID,
            for: indexPath
            ) as? PersonCollectionViewCell
            else { return UICollectionViewCell() }
        
        cell.configure(with: people[indexPath.row])
        return cell
    }
    
}
