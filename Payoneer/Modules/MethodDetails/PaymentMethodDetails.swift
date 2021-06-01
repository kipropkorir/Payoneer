//
//  PaymentMethodDetails.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import UIKit

class PaymentMethodDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardTypeLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    //MARK:- Properties
    var method: Applicable!
    
    //MARK:- Outlets

    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews(){
        DispatchQueue.global().async {
            let url = URL(string: self.method.links.logo)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.logoImageView.image = UIImage(data: data!)
            }
        }
        cardTypeLabel.text = method.method.replacingOccurrences(of: "_", with: " ")
    }

}

