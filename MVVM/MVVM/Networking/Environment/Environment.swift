//
//  Environment.swift
//  MVVM
//
//  Created by Gandhale, Gaurav on 7/20/17.
//  Copyright © 2017 Gandhale, Gaurav. All rights reserved.
//

import Foundation

struct EnvironmentConstants
{
    public static let serviceConfig:String = "Services"
    public static let defaultEnvironment:String = "default"
}

class Environment
{
    private static var selectedEnvironment:String = EnvironmentConstants.defaultEnvironment

    public static var currentEnvironment:String
    {
        get
        {
            return selectedEnvironment
        }
        
        set (newEnvironment)
        {
            if Environment.environments.contains(newEnvironment)
            {
                selectedEnvironment = newEnvironment
            }
            else
            {
                assert(false, "Services.plist does not contain environment \(newEnvironment)")
            }
        }
    }
    
    public static var environments: Array<String>
    {
        let servicePlist = NSDictionary.init(forPlist: EnvironmentConstants.serviceConfig)
        assert(servicePlist.allKeys.count > 0, "Services.plist cannot be empty")
        return servicePlist.allKeys as! Array<String>
    }
}
