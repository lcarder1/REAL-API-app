//
//  ViewController.swift
//  REAL API app
//
//  Created by Lauren Carder on 2/25/19.
//  Copyright © 2019 Lauren Carder. All rights reserved.
//

import UIKit

class MealViewController: UITableViewController {
    
    var categories = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal Categories"
        let query = "https://www.themealdb.com/api/json/v1/1/categories.php"
        if let url = URL(string: query)
        {
            if let data = try? Data(contentsOf: url)
            {
                let json = try! JSON(data: data)
                if json["status"] == "ok"
                {
                    parse(json: json)
                    return
                }
            }
        }
        loadError()
    }
    
    func parse(json: JSON)
    {
        for result in json["categories"].arrayValue
        {
            let strCategory = result["strCategory"].stringValue
            let strCategoryDescription = result["strCategoryDescription"].stringValue
            let category = ["strCategory" : strCategory, "strCategoryDescription" : strCategoryDescription]
           categories.append(category)
        }
        tableView.reloadData()
    }

    func loadError()
    {
        let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the current weather", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

