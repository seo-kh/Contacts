//
//  ContactsApp.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

@main
struct ContactsApp: App {
    @StateObject var contactViewModel: ContactViewModel = ContactViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contactViewModel)
        }
    }
}
