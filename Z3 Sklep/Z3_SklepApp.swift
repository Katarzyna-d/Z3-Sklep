//
//  Z3_SklepApp.swift
//  Z3 Sklep
//
//  Created by user225913 on 1/29/23.
//

import SwiftUI
//import CoreData

@main
struct Z3_SklepApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
