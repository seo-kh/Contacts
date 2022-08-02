//
//  ContactCRUDView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactCRUDView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var contactViewModel: ContactViewModel
    
    @State private var nameText: String = ""
    @State private var phoneNumberText: String = ""
    @State private var image: String = "person.fill"
    
    
    var body: some View {
        ScrollView {
            VStack {
                GroupBox("사진") {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    NavigationLink("사진 선택", destination: ImageSelectionView(image: $image))
                    
                }
                
                GroupBox("이름") {
                    TextField("이름", text: $nameText, prompt: Text("이름을 작성하세요."))
                        .background(Color(uiColor: UIColor.systemGray6))
                        .padding()
                        .keyboardType(.default)
                        .textContentType(.name)
                }
                GroupBox("전화번호") {
                    TextField("전화번호", text: $phoneNumberText, prompt: Text("전화번호를 작성하세요."))
                        .background(Color(uiColor: UIColor.systemGray6))
                        .padding()
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)
                } //: VSTACK
            } //: SCROLL
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle(contactViewModel.contact == nil ? "연락처 저장" : "연락처 편집")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(contactViewModel.contact == nil ? "추가" : "완료") {
                        let contact = ContactModel(name: nameText, phoneNumber: phoneNumberText, image: image)
                        contactViewModel.createContact(contact: contact)
                        dismiss()
                    }
                    
                }
            }
        } //: SCROLL
        .onAppear {
            if let contact = contactViewModel.contact {
                nameText = contact.name
                phoneNumberText = contact.phoneNumber
                image = contact.image
            }
        }
        .onDisappear {
            contactViewModel.contact = nil
        }
    }
}
