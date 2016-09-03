//
//  ViewController.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/16/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var loanAmountField: AddTextField!
    @IBOutlet weak var numMonthsField: AddTextField!
    @IBOutlet weak var interestRateField: AddTextField!
    @IBOutlet weak var paymentAmountField: AddTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController {
            if let loan = sender as? Loan {
                destination.loan = loan
            }
        }
    }

    @IBAction func calculate(_ sender: UIButton) {
        var numFilled = 0
        
        let loan = Loan()
        
        if let loanAmount = checkField(val: loanAmountField.text) {
            numFilled += 1
            loan.amount = loanAmount
        }
        
        if let numMonths = checkField(val: numMonthsField.text) {
            numFilled += 1
            loan.payments = numMonths
        }
        
        if let interestRate = checkField(val: interestRateField.text) {
            numFilled += 1
            loan.interest = interestRate
        }
        
        if let paymentAmount = checkField(val: paymentAmountField.text) {
            numFilled += 1
            loan.payment_amount = paymentAmount
        }
        
        
        if loan.payments.isNaN {
            let alertController = UIAlertController(title: "Unable to calculate # months", message: "These values would resulte in a infinite # of months.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)

        }
        else if numFilled < 3 {
            instructionLabel.textColor = UIColor.red
            instructionLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)!
            shakeAnimation(view: sender)
            
        } else {
            instructionLabel.textColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
            instructionLabel.font = UIFont(name: "Avenir Next", size: 15)!
            performSegue(withIdentifier: "ResultViewController", sender: loan)

        }
    }
    
    
    // MARK: functions
    
    func checkField(val: String?) -> Double? {
        if let unwrapedVal = val {
            if let num = Double(unwrapedVal) {
                return num
            }
        }
        
        return nil
    }
    
    func shakeAnimation(view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 15, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 15, y: view.center.y))
        view.layer.add(animation, forKey: "position")

    }
    
    
    // MARK: keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }

    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}

