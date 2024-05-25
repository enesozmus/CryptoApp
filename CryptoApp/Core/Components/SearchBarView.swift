//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty
                                 ? Color.theme.secondaryText
                                 : Color.theme.accent)
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled()
                .overlay(
                    ZStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.theme.accent)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .background(Color.theme.background)
                            .opacity(0.001)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchText = ""
                            }
                            .layoutPriority(-1)
                            .zIndex(-1)
                    }
                    
                    ,alignment: .trailing
                )
            //                .overlay(
            //                    Image(systemName: "xmark.circle.fill")
            //                        .padding()
            //                        .offset(x: 10)
            //                        .foregroundStyle(Color.theme.accent)
            //                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
            //                        .contentShape(Rectangle())
            //                        .onTapGesture {
            //                            //UIApplication.shared.endEditing()
            //                            searchText = ""
            //                        }
            //
            //                    ,alignment: .trailing
            //                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
