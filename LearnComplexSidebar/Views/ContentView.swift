//
//  ContentView.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 10/11/20.
//

import SwiftUI
import CoreData

let persistenceContainer = PersistenceController.shared

struct ContentView: View {
    
    @EnvironmentObject var envObj: EnvObj
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var items: FetchedResults<Item>
    
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                    
                VStack(alignment: .leading, spacing: 2) {
                    
                    // The toggle button
                    SideBarToggleButton()
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                    
                    VStack {
                        SideBarView()
                    }
                    
                    // The main thing which animates the sidebar
                    
                    .rotation3DEffect(
                        .degrees(self.envObj.showingSideBar ? 0 : 90),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .animation(.default)
                    .offset(x: self.envObj.showingSideBar ? 0 : -UIScreen.main.bounds.width, y: 0)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topLeading)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .leading)
            
            VStack {
                
                // Button to add items
                
                Button(action: {
                    addItem()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .foregroundColor(.black)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topTrailing)
            
        }
        
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.title = "Moby Kane"
            newItem.imageName = "person.circle"
            
            saveContext()
        }
    }
    
    func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                items[$0]
            }
            .forEach(viewContext.delete)
            
            saveContext()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, persistenceContainer.container.viewContext)
            .environmentObject(EnvObj())
    }
}
