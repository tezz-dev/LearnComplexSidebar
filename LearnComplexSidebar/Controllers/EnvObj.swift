//
//  EnvObj.swift
//  LearnComplexSidebar
//
//  Created by Tejas M R on 11/11/20.
//

import SwiftUI

class EnvObj: ObservableObject {
    @Published var showingSideBar: Bool
    
    init() {
        showingSideBar = false
    }
}
