//
//  ContactAddView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactAddView: View {
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
                    NavigationLink("사진 추가", destination: ImageSelectionView(image: $image))
                    
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
            .navigationTitle("연락처 저장")
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
                    Button("추가"){
                        let contact = ContactModel(name: nameText, phoneNumber: phoneNumberText, image: image)
                        contactViewModel.createContact(contact: contact)
                        dismiss()
                    }
                }
            }
        }
    }
}
