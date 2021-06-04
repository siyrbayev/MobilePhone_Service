//
//  ServiceTableViewCell.swift
//  Uslugi
//
//  Created by ADMIN ODoYal on 28.05.2021.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    static let identifier = "ServiceTableViewCell"
    static let nib = UINib(nibName: identifier, bundle: Bundle(for: ServiceTableViewCell.self))
    
    private var service: ServiceDetails?
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var iconImageview: UIImageView!
    @IBOutlet weak private var arrowIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = .systemGray6
        } else {
            contentView.backgroundColor = .none
        }
    }
}

// MARK: Private func
private extension ServiceTableViewCell {
    func configureLayout() {
        nameLabel.font = UIFont(name: "OpenSans-Regular", size: 15)
    }
}

// MARK: Public func
extension ServiceTableViewCell {
    func setServiceDetails(with service: ServiceDetails) {
        self.service = service
        nameLabel.text = service.name
        iconImageview.image = UIImage(named: service.iconName ?? "")
        
    }
}
