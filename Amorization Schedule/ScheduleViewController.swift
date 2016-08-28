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
    
    private var schedule = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        var balanceRemaining = loan.amount
        let payments = Int(ceil(loan.payments))
        
        for N in 1...payments {
            var A = round(100 * loan.payment_amount) / 100
            let R = loan.interest * 0.01 / 12
            let I = round(100 * balanceRemaining * R) / 100
            var P = A - I
            
            if N == payments {
                P = round(100 * balanceRemaining) / 100
                A = P + I
            }
            
            balanceRemaining -= P
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            
            var payment = Dictionary<String, String>()
            payment["N"] = "\(N)"
            payment["A"] = formatter.string(from: NSNumber(value: A))
            payment["I"] = formatter.string(from: NSNumber(value: I))
            payment["P"] = formatter.string(from: NSNumber(value: P))
            payment["B"] = formatter.string(from: NSNumber(value: balanceRemaining))
            
            schedule.append(payment)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(loan.payments)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? ScheduleTableViewCell {
            let payment = schedule[indexPath.row]
            
            cell.paymentNum.text = payment["N"]
            cell.paymentAmount.text = payment["A"]
            cell.interestAmount.text = payment["I"]
            cell.principleAmount.text = payment["P"]
            cell.balanceAmount.text = payment["B"]
            
            return cell
        }
        
        return UITableViewCell()
    }
}
