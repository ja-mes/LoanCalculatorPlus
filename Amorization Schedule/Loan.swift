//
//  Loan.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/17/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import CoreData

class Loan {
    private var _amount: Double = 0.0
    private var _interest: Double = 0.0
    private var _payments: Double = 0.0
    private var _payment_amount: Double = 0.0
    
    var amount: Double {
        get {
            return _amount
        }
        set {
            _amount = newValue
        }
    }
    
    var interest: Double {
        get {
            return _interest
        }
        set {
            _interest = newValue
        }
    }
    
    var payments: Double {
        get {
            return _payments
        }
        set {
            _payments = newValue
        }
    }
    
    var payment_amount: Double {
        get {
            return _payment_amount
        }
        set {
            _payment_amount = newValue
        }
    }
    
    init(amount: Double, interest: Double, payments: Double, payment_amount: Double) {
        _amount = amount
        _interest = interest
        _payments = payments
        _payment_amount = payment_amount
    }
    
    
    func save() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        let newLoan = NSEntityDescription.insertNewObject(forEntityName: "Loan", into: context)
        
        newLoan.setValue(_amount, forKey: "amount")
        newLoan.setValue(_interest, forKey: "interest")
        newLoan.setValue(_payments, forKey: "payments")
        newLoan.setValue(_payment_amount, forKey: "payment_amount")
        
        do {
            try newLoan.managedObjectContext?.save()
        } catch {
            print(error)
        }
        
    }
    
    
}
