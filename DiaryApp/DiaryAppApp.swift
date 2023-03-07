//
//  DiaryAppApp.swift
//  DiaryApp
//
//  Created by Ayça Işık on 7.03.2023.
//

import SwiftUI

@main
struct DiaryAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
