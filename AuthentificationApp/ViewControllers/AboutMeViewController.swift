//
//  AboutMeViewController.swift
//  AuthentificationApp
//
//  Created by Denis on 23.11.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var aboutText: UILabel!
    
    //MARK: Public Properties
    var text = ""
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutText.text = text
    }
    
}
