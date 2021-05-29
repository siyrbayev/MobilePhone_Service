//
//  UslugiViewController.swift
//  Uslugi
//
//  Created by ADMIN ODoYal on 28.05.2021.
//

import UIKit

class ServiceViewController: UIViewController {
    static let identifier = "ServiceViewController"
    static let nib = UINib(nibName: identifier, bundle: Bundle(for: ServiceViewController.self))
    
    @IBOutlet weak var serviceSegmentedControl: UISegmentedControl!
    @IBOutlet weak var serviceTableView: UITableView!
    
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
    @IBAction func didChangeServiceSegment(_ sender: UISegmentedControl) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureServiceTableView()
    }
}

// MARK: Internal func
extension ServiceViewController {
    func showAllServicesSegment() {
        serviceTableView.isHidden = false
    }
    
    func hideAllServicesSegment() {
        serviceTableView.isHidden = true
    }
    
    func showMyServicesSegment() {
        print("Show MyServices Segment")
    }
    
    func hideMyServicesSegment() {
        print("Hide MyServices Segment")
    }
    
    func configureLayout() {
        self.navigationItem.title = "Услуги"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 14)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let searchBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        searchBarButton.setImage(UIImage(named: "search-icon"), for: .normal)
        searchBarButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        searchBarButton.tintColor = UIColor(red: 0.095, green: 0.11, blue: 0.121, alpha: 1)
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem( customView: searchBarButton)
        
        serviceSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "OpenSans-SemiBold", size: 13)!], for: .normal)
    }
    
    func configureServiceTableView() {
        
        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        serviceTableView.register(ServiceTableViewCell.nib, forCellReuseIdentifier: ServiceTableViewCell.identifier)
        serviceTableView.separatorStyle = .none
    }
    
    func backButtonAction() {
       self.navigationController?.popViewController(animated: true)
     }
}

//MARK:
extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = serviceTableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as! ServiceTableViewCell
        
        cell.service = services[indexPath.row]
        
        return cell
    }
    
    
}
