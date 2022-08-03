//
//  ContactListView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactListView: View {
    @EnvironmentObject var contactViewModel: ContactViewModel
    
    @State private var searchText: String = ""
    
    var searchContacts: [ContactModel] {
        if searchText.isEmpty {
            return contactViewModel.contacts
        } else {
            return contactViewModel.contacts.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        List{
            ForEach(searchContacts) {
                contact in
                contactListCell(contact: contact)
            } //: LOOP
            .onDelete(perform: contactViewModel.delete)
            .onMove(perform: contactViewModel.move)
        } //: LIST
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "연락처"
        )
        .navigationTitle("연락처 목록")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            EditButton()
        }
    }
}

extension ContactListView {
    func contactListCell(contact: ContactModel) -> some View {
        Button {
            contactViewModel.contact = contact
            contactViewModel.addButtonActivate = true
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: contact.image)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(contact.name)
                        .font(.title3)
                        .fontWeight(.black)
                    Text(contact.phoneNumber)
                        .foregroundColor(.secondary)
                } //: VSTACK
            } //: HSTACK
        } //: BUTTON
        .tint(.primary)
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContactListView()
        }
        .environmentObject(ContactViewModel())
        
        ContactListView()
            .environmentObject(ContactViewModel())
    }
}
