//
//  FavouritemethodsTableViewController.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import UIKit

class PaymentMethodsTableViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    private enum AlertType{
        case notAuthorized
        case noDataAvailable
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    private var methods: [Applicable] = []
    
    var viewModel: PaymentMethodsListViewModel? {
        didSet{
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }
    
    //MARK:- Outlets

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PaymentMethodsListViewModel()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        loadingIndicator.startAnimating()
    }

    private func setupViewModel(with viewModel: PaymentMethodsListViewModel) {
        viewModel.didFetchPaymentMethodsData = {[weak self] (result) in
            switch result {
            case .success(let data):
                self?.methods = data.networks.applicable
                self?.tableView.reloadData()
                self?.loadingIndicator.stopAnimating()
            case .failure(let error):
            let alertType: AlertType
            switch error {
            case .notAuthorized:
                alertType = .notAuthorized
            case .noDataAvailable:
                alertType = .noDataAvailable
          
            self?.presentAlert(of: alertType)
                }
            }
        }
    }
                    
    private func presentAlert(of alertType: AlertType) {
            let title: String
            let message: String
            
            switch alertType {
            case .noDataAvailable:
                title = "failure_fetching_title".localized
                message = "failure_fetching_description".localized
            case .notAuthorized:
                title = "Unable to fetch dat"
                message = "Payoneer is not authorized to fetch any data."
        
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let vc = segue.destination as! PaymentMethodDetailsViewController
                vc.method = methods[indexPath.row]
            }
        }
    }
}
        

extension PaymentMethodsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if methods.count == 0 {
                self.tableView.setEmptyMessage("Your list is empty\nAdd a methods close to you now")
            } else {
                self.tableView.restore()
            }
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentMethodTableViewCell.reuseidentifier, for: indexPath) as? PaymentMethodTableViewCell else {
            fatalError("Unable to dequeue table view cell")
        }
        
        cell.nameLabel.text = methods[indexPath.row].label
        cell.nameLabel.text = methods[indexPath.row].label
        
        DispatchQueue.global().async {
            let url = URL(string: self.methods[indexPath.row].links.logo)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.logoImageView.image = UIImage(data: data!)
            }
        }
    
        return cell
    }
}

