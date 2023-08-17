//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

class RideHistoryViewController: UIViewController {
    
    @IBOutlet weak var rideTableView: UITableView!
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rideTableView.delegate = self
        rideTableView.dataSource = self
    }
}

// MARK: TableView

extension RideHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RideCell else {
            return UITableViewCell()
        }
        
        let ride = rideHistory[indexPath.row]
        
        cell.driverLabel.text = ride.0
        cell.priceLabel.text = ride.1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ride = rideHistory[indexPath.row]
        
        let alert = UIAlertController(title: "Price",
                                      message: "\(ride.1)",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
