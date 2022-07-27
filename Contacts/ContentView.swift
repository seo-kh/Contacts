//
//  ContentView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ContactMainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
