//
//  SideBarItem.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 10/11/20.
//

import SwiftUI

struct SideBarItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var items: FetchedResults<Item>
    
    @State var title: String = "No Title"
    @State var imageName: String = "xmark.circle.fill"
    @State var item: FetchedResults<Item>.Element
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 25, height: 25)
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .onTapGesture(perform: {
                    updateItem(item)
                })
        }
        .padding(10)
    }
    
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    func updateItem(_ item: FetchedResults<Item>.Element) {
        withAnimation {
            item.title = "Updated"
            saveContext()
        }
    }
}
