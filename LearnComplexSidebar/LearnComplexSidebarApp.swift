//
//  LearnComplexSidebarApp.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 10/11/20.
//

// This is a project to learn about a complex sideber which can be used in other projects

import SwiftUI

@main
struct LearnComplexSidebarApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
                .environmentObject(EnvObj())
        }
    }
}

struct LearnComplexSidebarApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, persistenceContainer.container.viewContext)
            .environmentObject(EnvObj())
    }
}
