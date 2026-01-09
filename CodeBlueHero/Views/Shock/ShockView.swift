//
//  ShockView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 1/9/26.
//

import SwiftUI

struct ShockView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "bolt.fill")
                .font(.system(size: 40))
                .foregroundStyle(.backgroundOrange500)
            Text("Shock")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ShockView()
}
