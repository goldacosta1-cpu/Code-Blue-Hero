//
//  RecentEventsRowView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/12/25.
//

import SwiftUI

struct RecentEventsRowView: View {
    
    var body: some View {
        HStack {
            Text("Code started")
                .font(.system(size: 12))
                .foregroundStyle(.textBlue700)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RecentEventsRowView()
}
