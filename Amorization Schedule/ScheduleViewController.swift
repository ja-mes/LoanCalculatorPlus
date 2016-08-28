//
//  ScheduleViewController.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/28/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    private var _loan: Loan!
    
    var loan: Loan {
        get {
            return _loan
        }
        set {
            _loan = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? ScheduleTableViewCell {
            cell.paymentNum.text = "5"
            return cell
        }
        
        return UITableViewCell()
    }
}
