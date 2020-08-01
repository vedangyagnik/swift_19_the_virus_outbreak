//
//  Patient.swift
//  Swift-19 Project
//
//  Created by Vedang Yagnik on 2020-04-09.
//  Copyright © 2020 Vedang Yagnik. All rights reserved.
//

import Foundation

class Patient {
    static var waitlistPArray:[Patient] = []
    var name:String
    var birthDate:String
    var age:Int = 0
    var priority:Int = 0
    var recentlyTravelled:Bool
    
    init(name:String, birthDate:String, recentlyTravelled:Bool){
        self.name = name
        self.birthDate = birthDate
        self.recentlyTravelled = recentlyTravelled
    }
    
    func calAge() {
        let dobArray = self.birthDate.components(separatedBy: "/")
        let dob = Calendar.current.date(from:DateComponents(year:Int(dobArray[2]), month:Int(dobArray[0]), day:Int(dobArray[1])))!
        self.age = Calendar.current.dateComponents([.year], from: dob, to: Date()).year!
    }
    
    func calPriority() {
        if (self.age <= 65 && !recentlyTravelled) {
           self.priority = 0
        } else {
            if(self.age > 65 && recentlyTravelled) {
                self.priority = 3
            } else if (self.age > 65) {
                self.priority = 2
            } else if (recentlyTravelled) {
                self.priority = 1
            }
        }
    }
}
