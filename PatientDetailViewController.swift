//
//  PatientDetailViewController.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-09.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class PatientDetailViewController: UIViewController {
    
    var testRequired:String?
    var priority:Int?
    var numInWaitList:Int?
    var pName:String?

    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var isTestRequired: UILabel!
    @IBOutlet weak var waitListNum: UILabel!
    @IBOutlet weak var waitListNumLabel: UILabel!
    @IBOutlet weak var PriorityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isTestRequired.text = testRequired!
        PriorityLabel.text = String(priority!)
        patientName.text = pName!
        if (priority! != 0) {
            waitListNum.text = String(numInWaitList!)
        } else {
            waitListNum.isHidden = true
            waitListNumLabel.isHidden = true
        }
    }


}

