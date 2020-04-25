//
//  GuestModel.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

struct GuestModel: Decodable {
    var page, perPage, total, totalPages: Int?
    var data: [GuestData]?
    var ad: Ad?
}

// MARK: - Ad
struct Ad: Decodable {
    var company: String?
    var url: String?
    var text: String?
}

// MARK: - Datum
struct GuestData: Decodable {
    var id: Int?
    var email, firstName, lastName: String?
    var avatar: String?
}

struct Guest {
    var page, perPage, total, totalPages: Int
    var company, url, text: String
    var id: Int
    var email, firstName, lastName, avatar: String
}

extension Guest: Equatable {
    static func == (lhs: Guest, rhs: Guest) -> Bool {
        return lhs.id == rhs.id
    }
}
