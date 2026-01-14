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
            .padding(.bottom, 24)
            Text("Select energy level for defibrillation")
                .font(.system(size: 14))
                .foregroundStyle(.textGray500)
                .padding(.bottom, 24)
            Text("Biphasic (Recommended)")
                .foregroundStyle(.textOrange600)
                .font(.system(size: 12))
                .bold()
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
            Button {
                
            } label: {
                Text("120 J \n\(Text("Biphasic").foregroundStyle(.textGray500).font(.system(size: 12)))")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.textGray700)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(.backgroundGray50)
                            .stroke(Color(.borderGray200), lineWidth: 2)
                    )
            }
            Button {
                
            } label: {
                Text("150 J \n\(Text("Biphasic").foregroundStyle(.textGray500).font(.system(size: 12)))")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.textGray700)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(.backgroundGray50)
                            .stroke(Color(.borderGray200), lineWidth: 2)
                    )
            }
            Button {
                
            } label: {
                Text("200 J \n\(Text("Biphasic (Standard)").foregroundStyle(.textGray500).font(.system(size: 12)))")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.textGray700)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(.backgroundGray50)
                            .stroke(Color(.borderGray200), lineWidth: 2)
                    )
            }
            Text("Monophasic")
                .foregroundStyle(.textGray500)
                .font(.system(size: 12))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .textCase(.uppercase)
                .padding(.top, 8)
                .padding(.bottom, 4)
            Button {
                
            } label: {
                Text("360 J \n\(Text("Monophasic").foregroundStyle(.textGray500).font(.system(size: 12)))")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.textGray700)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(.backgroundGray50)
                            .stroke(Color(.borderGray200), lineWidth: 2)
                    )
            }
            Spacer()
            Button {
                
            } label: {
                Text("Cancel")
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(.backgroundRed500)
                    )
                    .padding(.bottom, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
    }
}

#Preview {
    ShockView()
}
