//
//  Settings.swift
//  Notes Watch App
//
//  Created by mahesh lad on 18/06/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    
    // MARK: - FUNCTION
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
            
            // SLIDER
            Slider(value: Binding(get: {self.value}, set: { (newValue) in
                self.value = newValue
                self.update()
            }) , in: 1...4, step: 1)
                .accentColor(.accentColor)
                
        }
    }
}

#Preview {
    SettingsView()
}
