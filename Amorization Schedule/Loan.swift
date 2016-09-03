//
//  Loan.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/17/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import CoreData


// FIXME: Sometimes interest rate is negative

class Loan {
    private var _amount: Double?
    private var _interest: Double?
    private var _payments: Double?
    private var _payment_amount: Double?
    private var _totalAmount: Double?
    
    var amount: Double {
        get {
            if let amount = _amount {
                return amount
            } else if let A = _payment_amount, var i = _interest, let n = _payments {
                i = i * 0.01 / 12
                
                let P = (A - A * pow((i + 1), -n)) / i
                return P
            }
            return 0.0
        }
        set {
            _amount = newValue
        }
    }
    
    var interest: Double {
        get {
            if let interest = _interest {
                return interest
            } else if let N = _payments, let P = _payment_amount, let A = _amount {
                let q = log((1 + 1 / N)) / log(2)
                
                let i = pow((pow((1.0 + (P/A)), (1.0/q)) - 1.0), q) - 1
                
                return i * 100 * 12
            }
            
            return 0.0
        }
        set {
            _interest = newValue
        }
    }
    
    var payments: Double {
        get {
            if let payments = _payments {
                return payments
            }
            else if var i = _interest, let A  = _amount, let P = _payment_amount {
                i = i * 0.01 / 12
                
                let N = -(log((1-i*A/P)) / log((1 + i)))
                
                return N
                
            }
            
            return 0.0
        }
        set {
            _payments = newValue
        }
    }
    
    var payment_amount: Double {
        get {
            if let payment_amount = _payment_amount {
                return payment_amount
            } else if var i = _interest, let A = _amount, let N = _payments {
                i = i * 0.01 / 12
                let P = (i*A) / (1-pow((1+i), -N))
                return P
            }
            
            return 0.0

        }
        set {
            _payment_amount = newValue
        }
    }
    
    
    var total_amount: Double {
        let i = interest * 0.01 / 12
        let A = amount
        let N = payments
        let P = (i*A) / (1-pow((1+i), -N))
        return P * payments
    }
    
}





























