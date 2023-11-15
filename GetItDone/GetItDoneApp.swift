//
//  GetItDoneApp.swift
//  GetItDone
//
//  Created by Lexter Tapawan on 09/11/2023.
//

import SwiftUI

@main
struct GetItDoneApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
