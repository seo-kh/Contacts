//
//  ContactViewModel.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

enum ContactState: Hashable {
    case create
    case edit
}

class ContactViewModel: ObservableObject {
    @Published var contacts: [ContactModel] = [
        ContactModel(name: "철수", phoneNumber: "01045325353", image: "person"),
        ContactModel(name: "민수", phoneNumber: "01033524535", image: "person.circle"),
        ContactModel(name: "경수", phoneNumber: "01033907787", image: "person.fill.turn.down"),
        ContactModel(name: "진수", phoneNumber: "01077463219", image: "person.2"),
    ]
    @Published var column: Float = 2.0
    @Published var contact: ContactModel? = nil
    @Published var addButtonActivate: Bool = false
    
    func readContact(contact: ContactModel) -> Int {
        if let selectedContact = self.contact {
            return self.contacts.firstIndex{ $0.id == selectedContact.id } ?? 0
        }
        return 0
    }
    
    func createContact(contact: ContactModel) {
        contacts.append(contact)
    }
    
    func updateContact(contact: ContactModel) {
        if let selectedContact = self.contact {
            let index: Int = self.contacts.firstIndex { $0.id == selectedContact.id }!
            self.contacts[index] = contact
        }
    }
    
    func delete(at offset: IndexSet) {
        contacts.remove(atOffsets: offset)
    }
    
    @discardableResult
    func delete(index: Int) -> ContactModel {
        return contacts.remove(at: index)
    }
    
    func move(from: IndexSet, to: Int) {
        contacts.move(fromOffsets: from, toOffset: to)
    }
}
