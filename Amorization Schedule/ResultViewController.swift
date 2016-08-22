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

    }
    
    func dblAsInt(val: Double) -> String {
        if floor(val) == val {
            return "\(Int(val))"
        } else {
            return "\(val)"
        }

    }

}
