//
//  ContactMainView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactMainView: View {
    // MARK: - PROPERTEIS

    @EnvironmentObject var contactViewModel: ContactViewModel
    
    @State private var columns: [GridItem] = .init(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: 2)
    
    @State private var preferenceButtonActivate: Bool = false
    
    // MARK: - BODY

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(contactViewModel.contacts) { contact in
                    contactInfoView(contact: contact)
                } //: LOOP
            } //: VGRID
        } //: SCROLL
        .onAppear(perform: {
            columns = .init(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: Int(contactViewModel.column))
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .navigationTitle(preferenceButtonActivate ? "" : "연락처")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            preferenceButton
            addButton
        }
        .sheet(isPresented: $contactViewModel.addButtonActivate) {
            NavigationView {
                ContactCRUDView()
            }
        }
        .overlay {
            ContactDrawerView(preferenceButtonActivate: $preferenceButtonActivate)
        }
    }
}

// MARK: - EXTESION FOR SUBVIEWS

extension ContactMainView {
    /// 설정 버튼
    private var preferenceButton: some ToolbarContent {
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
            Button {
                    preferenceButtonActivate = true
            } label: {
                Label("세팅", systemImage: "gear")
                    .labelStyle(.iconOnly)
                    .opacity(preferenceButtonActivate ? 0 : 1)
            }
        }
    }
    
    /// 새 연락처 생성 버튼
    private var addButton: some ToolbarContent {
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
            Button {
                contactViewModel.addButtonActivate = true
            } label: {
                Label("연락처 생성", systemImage: "plus")
                    .labelStyle(.iconOnly)
            }

        }
    }
    
    /// 연락처 세부 뷰
    @ViewBuilder
    private func contactInfoView(contact: ContactModel) -> some View {
        Button {
            contactViewModel.addButtonActivate = true
            contactViewModel.contact = contact
        } label: {
            /// 메인 이미지
            Image(systemName: contact.image)
                .resizable()
                .aspectRatio(1.0 ,contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .border(.quaternary, width: 3.0)
                .cornerRadius(8.0)
                .overlay(alignment: .bottom) {
                    /// 세부 정보: 이름, 번호
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .bold()
                            .lineLimit(1)
                            .padding(.vertical, 1)
                        Text(contact.phoneNumber)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .padding(3)
                    .frame(maxWidth: .infinity)
                    .background(
                        Material.ultraThin
                    )
                    .cornerRadius(8.0)
                }
                .onLongPressGesture {
                    let index = contactViewModel.readContact(contact: contact)
                    contactViewModel.delete(index: index)
                }
        } //: BUTTON
        .foregroundColor(.primary)

    }
}

// MARK: - PREVIEW

struct ContactMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContactMainView()
        }
        .environmentObject(ContactViewModel())
    }
}
