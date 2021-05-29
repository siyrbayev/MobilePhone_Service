//
//  ViewController.swift
//  Uslugi
//
//  Created by ADMIN ODoYal on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func PushButtonPressed(_ sender: Any) {
        let vc = ServiceViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

