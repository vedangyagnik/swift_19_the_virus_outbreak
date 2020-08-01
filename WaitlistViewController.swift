//
//  WaitlistViewController.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-11.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class WaitlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\tName\t\t\t\t\t  Age\t  Priority"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Patient.waitlistPArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let box = UIAlertController(
            title: "Test Completed?",
            message: "Please click Yes if your test has been completed.",
            preferredStyle: .alert
        )
        box.addAction(
            UIAlertAction(title: "No", style: .default, handler: nil)
        )
        box.addAction(
            UIAlertAction(title: "Yes", style: .default, handler: {
                action in
                Patient.waitlistPArray.remove(at: indexPath.row)
                self.waitlistTableView.reloadData()
            })
        )
        self.present(box, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaitlistPatientTableViewCell") as! WaitlistPatientTableViewCell
        let patient = Patient.waitlistPArray[indexPath.row]
        cell.setPatient(p: patient, index: indexPath.row)

        return cell
    }
    

    @IBOutlet weak var waitlistTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.waitlistTableView.dataSource = self
        self.waitlistTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.waitlistTableView.reloadData()
    }

}
