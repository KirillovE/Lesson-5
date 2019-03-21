//
//  PersonCollectionViewCell.swift
//  l5_KirillovES
//
//  Created by Евгений Кириллов on 21/03/2019.
//  Copyright © 2019 Триада. All rights reserved.
//

import UIKit

final class PersonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var company: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = containerView.frame.width / 20
        containerView.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    }
}

extension PersonCollectionViewCell: Configurable {
    func configure(with viewModel: Person) {
        name.text = viewModel.name
        email.text = viewModel.email
        company.text = viewModel.company.name
    }
}
