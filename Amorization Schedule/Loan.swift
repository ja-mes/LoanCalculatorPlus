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
    private var _amount: Double?
    private var _interest: Double?
    private var _payments: Double?
    private var _payment_amount: Double?
    
    var amount: Double {
        get {
            return grabAmount()
        }
        set {
            _amount = newValue
        }
    }
    
    var interest: Double {
        get {
            return grabInterest()
        }
        set {
            _interest = newValue
        }
    }
    
    var payments: Double {
        get {
            return grabPayments()
        }
        set {
            _payments = newValue
        }
    }
    
    var payment_amount: Double {
        get {
            return grabPaymentAmount()
        }
        set {
            _payment_amount = newValue
        }
    }
    
    func grabAmount() -> Double {
        if let amount = _amount {
            
            return amount
        } else if let A = _payment_amount, var i = _interest, let n = _payments {
            i = i * 0.01 / 12
            let P = (A - A * pow((i + 1), -n)) / i
            return round(100 * P) / 100
        }
        return 0.0
    }
    
    func grabInterest() -> Double {
        if let interest = _interest {
            return interest
        } else if let P = _payment_amount, let A = _amount, let N = _payments {
            let q = log((1 + 1 / N)) / log(2)
            let i = pow((pow((1.0 + (P/A)), (1.0/q)) - 1.0), q) - 1
            return round(100 * i * 100 * 12) / 100
        }
        return 0.0
    }
    
    func grabPayments() -> Double {
        if let payments = _payments {
            return payments
        }
        else if let i = _interest, let A = _amount, let P = _payment_amount {
            let N = -(log((1-i*A/P)) / log((1 + i)))
            return round(100 * N) / 100
        }
        return 0.0
    }
    
    func grabPaymentAmount() -> Double {
        if let payment_amount = _payment_amount {
            return payment_amount
        } else if let i = _interest, let A = _amount, let N = _payments {
            let P = (i*A) / (1-pow((1+i), -N))
            return round(100 * P) / 100
        }
        return 0.0
    }
    
    
}





























