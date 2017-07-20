//
//  File.swift
//  MVVM
//
//  Created by Gandhale, Gaurav on 7/19/17.
//  Copyright © 2017 Gandhale, Gaurav. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    public convenience init(forPlist file: String) {
        guard let path = Bundle.main.path(forResource: file, ofType: "plist"),
            let dicRoot = NSDictionary(contentsOfFile: path) else {
                self.init()
                return
        }
        self.init(dictionary: dicRoot)
    }
}
