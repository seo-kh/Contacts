//
//  ContactListView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactListView: View {
    @EnvironmentObject var contactViewModel: ContactViewModel
    
    var body: some View {
        List{
            ForEach(contactViewModel.contacts) {
                contact in
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
            } //: LOOP
            .onDelete(perform: contactViewModel.delete)
            .onMove(perform: contactViewModel.meve)
        } //: LIST
        .navigationTitle("연락처 목록")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            EditButton()
        }
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
