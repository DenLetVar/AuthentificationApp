//
//  AdditionalInfoViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 23.11.2022.
//

import UIKit

class AdditionalInfoViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var textAbout: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelReading(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
