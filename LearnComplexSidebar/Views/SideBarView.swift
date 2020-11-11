//
//  SideBarView.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 10/11/20.
//

import SwiftUI

struct SideBarView: View {
    
    @EnvironmentObject var envObj: EnvObj
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    SideBarItem(title: item.title ?? "No Title", imageName: item.imageName ?? "xmark.circle.fill", item: item)
                }
                .onDelete(perform: deleteItem)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.9)
        .cornerRadius(30, corners: [.topRight, .bottomRight])
        .shadow(color: .black, radius: 3, x: 3, y: 3)
        
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    func deleteItem(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                items[$0]
            }
            .forEach(viewContext.delete)
            
            saveContext()
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
            .environmentObject(EnvObj())
            .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
    }
}
