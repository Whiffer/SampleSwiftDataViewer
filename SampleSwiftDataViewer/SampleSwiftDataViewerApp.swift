//
//  SampleSwiftDataViewerApp.swift
//  SampleSwiftDataViewer
//
//  Created by Chuck Hartman on 9/23/23.
//

import SwiftUI
import SwiftData
import SwiftDataContainerViewer

@main
struct SampleSwiftDataViewerApp: App {
    
    static var modelTypes = [
        Item.self,
    ] as [any PersistentModel.Type]

    var sharedModelContainer: ModelContainer = {
        let schema = Schema(modelTypes)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        WindowGroup(id: "swiftdata-viewer") {
            SwiftDataContainerViewer(modelTypes: SampleSwiftDataViewerApp.modelTypes)
        }
        .modelContainer(sharedModelContainer)
    }
}
