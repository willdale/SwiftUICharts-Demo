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


struct DemoContainer: View {
    
    var body: some View {
        #if os(iOS)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .shadow(color: Color(.gray), radius: 12, x: 0, y: 0)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color(.systemBackground))
        #elseif os(macOS)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .shadow(color: Color(.lightGray), radius: 12, x: 0, y: 0)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color(.windowBackgroundColor))
        #elseif os(tvOS)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .shadow(color: Color(.gray), radius: 12, x: 0, y: 0)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color(.clear))
        #endif
    }
}
