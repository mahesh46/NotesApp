//
//  CreditisView.swift
//  Notes Watch App
//
//  Created by mahesh lad on 18/06/2025.
//

import SwiftUI

struct CreditsView: View {
    
  
    var body: some View {
        VStack(spacing: 3) {
            // Profile image
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(.primary)
            // header
            HeaderView(title: "Credits")
            // conntent
            Text("Mahesh Lad")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
