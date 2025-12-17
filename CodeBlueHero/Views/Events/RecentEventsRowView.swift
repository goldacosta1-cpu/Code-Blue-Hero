//
//  RecentEventsRowView.swift
//  CodeBlueHero
//
//  Created by Lawrence Gimenez on 12/12/25.
//

import SwiftUI

struct RecentEventsRowView: View {
    
    var body: some View {
        HStack(spacing: 12) {
            Text("12:44:24")
                .foregroundStyle(.textBlue600)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(.backgroundBlue50)
                .font(.system(size: 12))
                .clipShape(Capsule())
            Text("Code started")
                .font(.system(size: 12))
                .foregroundStyle(.textBlue700)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RecentEventsRowView()
}
