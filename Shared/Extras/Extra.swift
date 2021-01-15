//
//  Extra.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI

struct CustomButton: ViewModifier {
    
    #if !os(macOS)
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.primary, lineWidth: 2)
            )
    }
    #else
    
    func body(content: Content) -> some View {
        content
    }
    #endif
}
