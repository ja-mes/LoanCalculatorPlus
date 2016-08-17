//
//  ViewController.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/16/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var loanAmountField: AddTextField!
    @IBOutlet weak var numMonthsField: AddTextField!
    @IBOutlet weak var interestRateField: AddTextField!
    @IBOutlet weak var paymentAmountField: AddTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func calculate(_ sender: AnyObject) {
        let loanAmount = Double(loanAmountField.text!)!
        let numMonths = Double(numMonthsField.text!)!
        let interestRate = Double(interestRateField.text!)!
        let paymentAmount = Double(paymentAmountField.text!)!
        
        let loan = Loan(amount: loanAmount, interest: interestRate, payments: numMonths, payment_amount: paymentAmount)
        
        loan.save()
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}

