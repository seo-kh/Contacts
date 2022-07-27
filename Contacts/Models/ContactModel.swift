//
//  ContactModel.swift
//  Contacts
//
//  Created by 서광현 on 2022/07/27.
//

import Foundation

struct ContactModel: Identifiable {
    let name: String
    let phoneNumber: String
    let image: String
    var id = UUID().uuidString
}
