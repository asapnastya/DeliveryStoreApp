//
//  ProfileViewController.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
}
