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
                .padding()
                .background(Circle()
                    .fill(Color(.backgroundOrange50)))
            Text("Shock")
                .font(.system(size: 24))
                .foregroundStyle(.textGray900)
                .bold()
            HStack {
                Button {
                    
                } label: {
                    Text("Shocks Given:")
                        .font(.system(size: 12))
                        .foregroundStyle(.textGray600)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.backgroundGray100)
                        .clipShape(Capsule())
                }
                Button {
                    
                } label: {
                    Text("Next: Shock:")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.backgroundOrange500)
                        .font(.system(size: 12))
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 12)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ShockView()
}
