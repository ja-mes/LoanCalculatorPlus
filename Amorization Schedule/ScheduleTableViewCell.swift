//
//  ScheduleTableViewCell.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/28/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var paymentNum: UILabel!
    @IBOutlet weak var paymentAmount: UILabel!
    @IBOutlet weak var principleAmount: UILabel!
    @IBOutlet weak var interestAmount: UILabel!
    @IBOutlet weak var balanceAmount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
