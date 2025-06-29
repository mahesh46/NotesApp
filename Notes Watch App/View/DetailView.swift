//
//  DetailView.swift
//  Notes Watch App
//
//  Created by mahesh lad on 18/06/2025.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTY
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView(title: "")
            
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(
                        isPresented: $isSettingsPresented,
                        content: { SettingsView()
                        })
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(
                        isPresented: $isCreditsPresented,
                        content: { CreditsView()
                        })
                
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

#Preview {
    let sampleData: Note = Note(id: UUID(), text: "Hello world")
    DetailView(note: sampleData, count: 5, index: 1)
}
