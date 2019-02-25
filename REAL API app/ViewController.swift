//
//  ViewController.swift
//  REAL API app
//
//  Created by Lauren Carder on 2/25/19.
//  Copyright © 2019 Lauren Carder. All rights reserved.
//

import UIKit

class CurrentlyViewController: UITableViewController {
    
    var currently = [[String: String]]()
    let apiKey = "05967568c1605ce17149c4b66b8f6c61"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Information"
        let query = "https://api.darksky.net/forecast/05967568c1605ce17149c4b66b8f6c61/37.8267,-122.4233"
    }


}

