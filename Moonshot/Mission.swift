//
//  Mission.swift
//  Moonshot
//
//  Created by Héctor Manuel Sandoval Landázuri on 18/05/22.
//

import Foundation


struct Mission: Codable,Identifiable {
    struct CrewRole: Codable {
        let name:String
        let role:String
    }
    let id:Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image:String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate:String {
        launchDate?.formatted(date:.abbreviated,time:.omitted) ?? "N/A"
    }
    
    var accessibleLaunchDate: String {
        formattedLaunchDate.replacingOccurrences(of: "Launch date: N/A", with: "Launch date is not found")
    }
    
    var completedLaunchDate:String {
        launchDate?.formatted(date:.complete,time:.omitted) ?? "N/A"
    }

    
}
