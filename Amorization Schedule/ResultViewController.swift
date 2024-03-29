//
//  ResultViewController.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/18/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var monthlyPayment: UILabel!
    @IBOutlet weak var loanAmount: UILabel!
    @IBOutlet weak var numMonths: UILabel!
    @IBOutlet weak var interestRate: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    // MARK: Properties
    private var _loan: Loan!
    
    var loan: Loan {
        get {
            return _loan
        }
        set {
            _loan = newValue
        }
    }

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        monthlyPayment.text = formatter.string(from: NSNumber(value: loan.payment_amount))
        loanAmount.text = formatter.string(from: NSNumber(value: loan.amount))
        
        interestRate.text = "\(dblAsInt(val: loan.interest))%"
        numMonths.text = dblAsInt(val: loan.payments)
        
        totalAmount.text = formatter.string(from: NSNumber(value: loan.total_amount))
        
        if loan.interest < 0 {
            let alertController = UIAlertController(title: "Interest rate is negative", message: "You probably don't wont that. You might want to change some values", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    func dblAsInt(val: Double) -> String {
        if floor(val) == val {
            return "\(Int(val))"
        } else {
            return "\(round(100 * val) / 100)"
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScheduleViewController {
            if let loan = sender as? Loan {
                destination.loan = loan
            }
        }
    }

    @IBAction func viewAmorizationTable(_ sender: AnyObject) {
        performSegue(withIdentifier: "ScheduleViewController", sender: loan)
    }
}
