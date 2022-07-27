//
//  ContactSettingView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactSettingView: View {
    @EnvironmentObject var contactViewModel: ContactViewModel
    
    var body: some View {
        List {
            GroupBox("열 설정", content: {
                VStack(spacing: 20) {
                    Text("이미지 그리드의 열을 설정합니다.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        ForEach(0..<Int(contactViewModel.column), id: \.self) {
                            _ in
                            Image(systemName: "person")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fill)
                                .frame(width: 50, height: 50)
                        }
                    }
                    Slider(value: $contactViewModel.column, in: 1.0...3.0, step: 1.0, onEditingChanged: onEditingChanged)
                    Text("현재 \(Int(contactViewModel.column))열")
                        .bold()
                }
            })
        }
        .listStyle(.plain)
        .padding()
        .animation(.easeOut, value: contactViewModel.column)
        .navigationTitle("설정")
    }
    
    func onEditingChanged(isChage: Bool) {
        
    }
}

struct ContactSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ContactSettingView()
    }
}
