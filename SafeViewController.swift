//
//  SafeViewController.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-11.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class SafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var safeData:[Patient]?
    @IBOutlet weak var safeTableView: UITableView!
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\tName\t\t\t\t\t Age     Travelled?"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return safeData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SafePatientTableViewCell") as! SafePatientTableViewCell
        let patient = safeData![indexPath.row]
        cell.setPatient(p: patient, index: indexPath.row)

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.safeTableView.dataSource = self
        self.safeTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.safeTableView.reloadData()
    }

}
