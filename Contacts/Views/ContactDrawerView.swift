//
//  ContactDrawerView.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import SwiftUI

struct ContactDrawerView: View {
    @Binding var preferenceButtonActivate: Bool
    
    let screedWidth: CGFloat = UIScreen.main.bounds.width
    @State private var offset: CGFloat = .zero
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(uiColor: UIColor.systemGray).opacity(0.8)
                .ignoresSafeArea()
                .onTapGesture {
                    preferenceButtonActivate = false
                }
                .opacity(preferenceButtonActivate ? 1 : 0)
            
            
            Color(uiColor: UIColor.systemBackground)
                .ignoresSafeArea()
                .frame(width: screedWidth * 0.8)
                .overlay {
                    VStack(spacing: 4) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                            .background(Circle().stroke())
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading ,spacing: 4) {
                            HStack {
                                Text("내 정보")
                                    .font(.title3)
                                    .fontWeight(.black)
                            }
                            HStack {
                                Text("이름").bold()
                                Text("김OO")
                            }
                            HStack {
                                Text("번호").bold()
                                Text("01033234434")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        List {
                            NavigationLink("연락처", destination: ContactListView())
                            NavigationLink("세팅", destination: Text("세팅"))
                        }
                    }
                }
                .offset(x: preferenceButtonActivate ? 0 : -screedWidth * 0.8)
                .offset(x: offset)
                .animation(.easeOut(duration: 0.5), value: offset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offset = value.translation.width
                            if offset > 0 { offset = .zero }
                            if offset < -screedWidth * 0.5 { preferenceButtonActivate = false }
                        })
                        .onEnded({ _ in
                            offset = .zero
                        })
                )
        }
        .onDisappear{ offset = .zero }
        .animation(.easeOut(duration: 0.5), value: preferenceButtonActivate)
    }
}
