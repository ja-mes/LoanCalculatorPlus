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
        
        monthlyPayment.text = String(loan.payment_amount)
        loanAmount.text = String(loan.amount)
        numMonths.text = String(loan.payments)
        interestRate.text = String(loan.interest)
    }

}
