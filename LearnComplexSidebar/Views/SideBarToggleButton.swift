//
//  SideBarToggleButton.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 10/11/20.
//

import SwiftUI

struct SideBarToggleButton: View {
    
    @EnvironmentObject var envObj: EnvObj
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var items: FetchedResults<Item>
    
    var body: some View {
        
        VStack {            
            Button(action: {
                self.envObj.showingSideBar.toggle()
            }) {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .frame(width: 25, height: 20)
                .padding(.horizontal, 16)
                .padding(.vertical, 13)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(20, corners: [.topRight, .bottomRight])
            }
        }
    }
}

struct SideBarToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        SideBarToggleButton()
            .environmentObject(EnvObj())
    }
}
