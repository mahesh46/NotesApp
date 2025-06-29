//
//  ContentView.swift
//  Notes Watch App
//
//  Created by mahesh lad on 18/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    
    // MARK: - PROPERTY
    @State private var notes : [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    
    func save() {
       // dump(notes) //dumps note array inn consol
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes.json")
            try data.write(to: url)
        } catch {
            print("saving data has failed")
        }
    }
    
    func load() {
      DispatchQueue.main.async {
          do {
              let url = getDocumentDirectory().appendingPathComponent("notes.json")
              let data = try Data(contentsOf: url)
              notes = try JSONDecoder().decode([Note].self, from: data)
          } catch {
              //do noting as can be empty
          }
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        save()
    }
    
    // MARK: - BODY
    
    
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack (alignment: .center, spacing: 6) {
                    TextField("Add new Note", text: $text)
                    
                    Button {
                        // ACTION
                        guard text.isEmpty == false else {return}
                        let note =  Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        save()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    // .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                }
                Spacer()
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(
                                destination: DetailView(
                                    note: notes[i],
                                    count: notes.count,
                                    index: i
                                )
                            ) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                    
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                     Spacer()
                      Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(20)
                    Spacer()
                        
                }
            }
          
            
            
            
          //  Text("\(notes.count)")
            .navigationTitle("Notes")
            .onAppear(perform: load)
        }
    }
}

#Preview {
    ContentView()
}
