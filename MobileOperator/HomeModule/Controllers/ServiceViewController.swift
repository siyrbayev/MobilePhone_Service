//
//  UslugiViewController.swift
//  Uslugi
//
//  Created by ADMIN ODoYal on 28.05.2021.
//

import UIKit

class ServiceViewController: UIViewController {
    
    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    @IBOutlet weak private var tableView: UITableView!
    
    private let services = [ServiceDetails](
        arrayLiteral:
            ServiceDetails(name: "Интернет", iconName: "earth-west-Icon"),
        ServiceDetails(name: "Роуминг", iconName: "plane-line-icon"),
        ServiceDetails(name: "Развлекательные", iconName: "joystick-Icon"),
        ServiceDetails(name: "Звонки", iconName: "call-talking-Icon"),
        ServiceDetails(name: "При нуле", iconName: "savings-Icon"),
        ServiceDetails(name: "SMS", iconName: "email-otlined-Icon"),
        ServiceDetails(name: "Полезное", iconName: "lightbulb-Icon")
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTableView()
    }
    
    @IBAction private func didChangeServiceSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            hideMyServicesSegment()
            showAllServicesSegment()
        case 1:
            hideAllServicesSegment()
            showMyServicesSegment()
        default:
            break
        }
    }
}

// MARK: Internal func
extension ServiceViewController {
    func showAllServicesSegment() {
        tableView.isHidden = false
    }
    
    func hideAllServicesSegment() {
        tableView.isHidden = true
    }
    
    func showMyServicesSegment() {
        print("Show MyServices Segment")
    }
    
    func hideMyServicesSegment() {
        print("Hide MyServices Segment")
    }
    
    func configureLayout() {
        title = "Услуги"
        configureNavigationBar()
        configureSegmentedControl()
        configureNavigationController()
    }
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ServiceTableViewCell.nib, forCellReuseIdentifier: ServiceTableViewCell.identifier)
        
    }
    
    func configureSegmentedControl() {
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "OpenSans-SemiBold", size: 13)!], for: .normal)
    }
    
    func configureNavigationBar() {
        let searchBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        searchBarButton.setImage(UIImage(named: "search-icon"), for: .normal)
        searchBarButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        searchBarButton.tintColor = UIColor(red: 0.095, green: 0.11, blue: 0.121, alpha: 1)
        navigationItem.rightBarButtonItem =  UIBarButtonItem( customView: searchBarButton)
    }
    
    func configureNavigationController() {
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 14)!]
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

//MARK: UITableViewDataSource
extension ServiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as! ServiceTableViewCell
        
        cell.setServiceDetails(with: services[indexPath.row])
        
        return cell
    }
}


//MARK: UITableViewDelegate
extension ServiceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell with name: \(services[indexPath.row].name!)")
    }
}
