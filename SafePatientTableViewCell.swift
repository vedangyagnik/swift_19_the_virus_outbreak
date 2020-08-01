//
//  SafePatientTableViewCell.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-11.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class SafePatientTableViewCell: UITableViewCell {

    @IBOutlet weak var cellSafePatientIndex: UILabel!
    @IBOutlet weak var cellSafePatientName: UILabel!
    @IBOutlet weak var cellSafePatientAge: UILabel!
    @IBOutlet weak var cellSafePatientTravel: UILabel!
    
    func setPatient(p:Patient, index:Int){
        cellSafePatientName.text = p.name
        cellSafePatientAge.text = String(p.age)
        cellSafePatientTravel.text = p.recentlyTravelled ? "Yes" : "No"
        cellSafePatientIndex.text = "\(index + 1)."
    }
}
