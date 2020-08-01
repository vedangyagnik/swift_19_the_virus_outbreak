//
//  WaitlistPatientTableViewCell.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-11.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class WaitlistPatientTableViewCell: UITableViewCell {

    @IBOutlet weak var cellPatientName: UILabel!
    @IBOutlet weak var cellPatientAge: UILabel!
    @IBOutlet weak var cellPatientPriority: UILabel!
    @IBOutlet weak var cellPatientIndex: UILabel!
    
    func setPatient(p:Patient, index:Int){
        cellPatientName.text = p.name
        cellPatientAge.text = String(p.age)
        cellPatientPriority.text = String(p.priority)
        cellPatientIndex.text = "\(index + 1)."
        switch p.priority {
            case 3:
                cellPatientName.textColor = .red
                cellPatientPriority.textColor = .red
                cellPatientAge.textColor = .red
            case 2:
                cellPatientName.textColor = .orange
                cellPatientPriority.textColor = .orange
                cellPatientAge.textColor = .orange
            case 1:
                cellPatientName.textColor = .green
                cellPatientPriority.textColor = .green
                cellPatientAge.textColor = .green
            default:
                cellPatientName.textColor = .white
                cellPatientPriority.textColor = .white
                cellPatientAge.textColor = .white
        }
    }

}
