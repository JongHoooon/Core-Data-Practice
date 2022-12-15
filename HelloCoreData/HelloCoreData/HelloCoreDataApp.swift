//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by JongHoon on 2022/12/15.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
