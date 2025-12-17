//
//  CodeLog.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/17/25.
//

import SwiftData
import Foundation

@Model
class CodeLog {
    
    @Attribute(.unique) var id: String
    var title: String
    var startDate: Date
    
    init(id: String, title: String, startDate: Date) {
        self.id = id
        self.title = title
        self.startDate = startDate
    }
}
