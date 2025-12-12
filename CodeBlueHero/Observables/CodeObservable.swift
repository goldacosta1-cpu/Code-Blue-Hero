//
//  CodeObservable.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/8/25.
//

import SwiftUI

@Observable
class CodeObservable {
    
    enum CprStatus: String {
        case started = "INITIAL ACTIONS:\n\n• Begin bag-mask ventilation and give oxygen\n• Attach monitor/defibrillator\n• Ensure high-quality CPR is ready to begin\n\nOnce ready, start CPR and assess initial rhythm at 2-minute mark."
    }
    
    var enableTabAccessory = false
    var cprStatus: CprStatus = .started
}
