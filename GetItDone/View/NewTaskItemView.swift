//
//  NewTaskItemView.swift
//  GetItDone
//
//  Created by Lexter Tapawan on 14/11/2023.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    @FocusState private var hideKeyboard: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // MARK: - FUNCTION
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            isShowing = false
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .focused($hideKeyboard)
                    .foregroundStyle(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    addItem()
                    hideKeyboard = false
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }) //: BUTTON
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "soud-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW

#Preview {
    NewTaskItemView(isShowing: .constant(true))
        .background(Color.gray.ignoresSafeArea(edges: .all))
}
