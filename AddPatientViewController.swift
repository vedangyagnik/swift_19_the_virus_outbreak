//
//  AddPatientViewController.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-09.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController {

    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var isRecentlyTravelled: UISwitch!
    let datePicker = UIDatePicker()
    
    var safePatients:[Patient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPatientDetails") {
            let patientDetails = segue.destination as! PatientDetailViewController
            
            patientDetails.pName = patientName.text!
            
            let p = Patient.init(name: patientName.text!, birthDate: dateOfBirth.text!, recentlyTravelled: isRecentlyTravelled.isOn)
            p.calAge()
            p.calPriority()
            
            patientDetails.priority = p.priority
            if(p.priority != 0) {
                Patient.waitlistPArray.append(p)
                patientDetails.testRequired = "Yes"
                Patient.waitlistPArray = Patient.waitlistPArray.sorted(by: {$0.priority > $1.priority})
                let index = Patient.waitlistPArray.firstIndex(where: {($0.name == p.name)})
                patientDetails.numInWaitList = index! + 1
            } else {
                safePatients.append(p)
                patientDetails.testRequired = "No"
                safePatients = safePatients.sorted(by: {$0.name.lowercased() < $1.name.lowercased()})
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        let safePatientTab = self.tabBarController?.viewControllers?[2] as! SafeViewController
        safePatientTab.safeData = safePatients
    }
    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        datePickerTextField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelDateClicked))
        
        toolbar.setItems([cancelButton, spaceButton, doneBtn], animated: true)
        datePickerTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDateClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/YYYY"
        datePickerTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDateClicked(){
        self.view.endEditing(true)
    }
    
    @IBAction func AddPatient(_ sender: UIButton) {
        if(patientName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            let errorAlertBox = UIAlertController(
                title: "Error",
                message: "Please enter patient name",
                preferredStyle: .alert
            )
            errorAlertBox.addAction(UIAlertAction(
                title: "Dismiss",
                style: .default,
                handler: nil)
            )
            self.present(errorAlertBox, animated: true)
        } else if(datePickerTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            let errorAlertBox = UIAlertController(
                title: "Error",
                message: "Please select birth date",
                preferredStyle: .alert
            )
            errorAlertBox.addAction(UIAlertAction(
                title: "Dismiss",
                style: .default,
                handler: nil)
            )
            self.present(errorAlertBox, animated: true)
        } else {
            performSegue(withIdentifier: "showPatientDetails", sender: self)
            resetProperties()
        }
    }
    
    @IBAction func cancelPatient(_ sender: UIButton) {
        resetProperties()
    }
    
    func resetProperties(){
        datePickerTextField.text = ""
        patientName.text = ""
        isRecentlyTravelled.isOn = false
    }
}

