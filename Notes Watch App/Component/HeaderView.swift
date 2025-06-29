//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by mahesh lad on 18/06/2025.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    var body: some View {
       
        VStack {
            // title
           
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
        
            
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
                
            }
            .foregroundColor(.accentColor)
        }
       
    }
    
}

#Preview {
    
        HeaderView(title: "credit")
        //  HeaderView()
    
}

#Preview {
    
       
          HeaderView()
    
}
