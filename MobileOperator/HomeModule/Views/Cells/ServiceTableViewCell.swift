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
    
    public var service: ServiceDetails? {
        didSet {
            if let service = service {
                nameLabel.text = service.name
                iconImageview.image = UIImage(named: service.iconName ?? "")
            }
        }
    }
    
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var iconImageview: UIImageView!
    @IBOutlet weak private var arrowIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
}

// MARK: Internal func
extension ServiceTableViewCell {
    func configureLayout() {
        nameLabel.font = UIFont(name: "OpenSans-Regular", size: 15)
        
        bottomLineView.layer.borderWidth = 0.5
        bottomLineView.layer.borderColor = UIColor(red: 0.854, green: 0.867, blue: 0.88, alpha: 1).cgColor
    }
}
