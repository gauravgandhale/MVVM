//
//  Services.swift
//  MVVM
//
//  Created by Gandhale, Gaurav on 7/19/17.
//  Copyright © 2017 Gandhale, Gaurav. All rights reserved.
//

import Foundation

struct ServiceKeyConstants
{
    public static let host:String = "host"
}

class Service
{
    private static var host:String
    {
        get
        {
            return Service.configData.value(forKey: ServiceKeyConstants.host) as! String
        }
    }
    
    public static var configData:NSDictionary
    {
        let servicePlist = NSDictionary.init(forPlist: EnvironmentConstants.serviceConfig)
        guard let configData:NSDictionary = servicePlist.value(forKey: Environment.currentEnvironment) as? NSDictionary else
        {
            assert(false, "Entries in \(Environment.currentEnvironment) should be of type NSDictionary")
        }
        return configData
    }
    
    public static func valueFor(key: String) -> String
    {
        guard let configValue = Service.configData.value(forKey: key) as? String else
        {
            assert(false, "Missing Entry for key \(key) in \(Environment.currentEnvironment)")
        }
        return configValue.replacingOccurrences(of: "{\(ServiceKeyConstants.host)}", with: host)
    }
}
