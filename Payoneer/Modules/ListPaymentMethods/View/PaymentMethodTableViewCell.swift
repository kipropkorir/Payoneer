//
//  FavouriteLocationTableViewCell.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import UIKit

class PaymentMethodTableViewCell: UITableViewCell {
    //MARK:- properties
    static var reuseidentifier: String {
        return String(describing: self)
    }
    
    //MARK:- Outlets
    @IBOutlet var nameLabel: UILabel! {
        didSet{
            nameLabel.font = UIFont.Payoneer.lightRegular
        }
    }
    
    //MARK:- Outlets
    @IBOutlet var logoImageView: UIImageView! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
