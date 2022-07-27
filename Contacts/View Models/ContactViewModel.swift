//
//  ContactViewModel.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

class ContactViewModel: ObservableObject {
    @Published var contacts: [ContactModel] = [
        ContactModel(name: "철수", phoneNumber: "01045325353", image: "person"),
        ContactModel(name: "민수", phoneNumber: "01033524535", image: "person.circle"),
        ContactModel(name: "경수", phoneNumber: "01033907787", image: "person.fill.turn.down"),
        ContactModel(name: "진수", phoneNumber: "01077463219", image: "person.2"),
    ]
    @Published var column: Float = 2.0
    
    func createContact(contact: ContactModel) {
        contacts.append(contact)
    }
    
    func delete(at offset: IndexSet) {
        contacts.remove(atOffsets: offset)
    }
    
    func meve(from: IndexSet, to: Int) {
        contacts.move(fromOffsets: from, toOffset: to)
    }
}
