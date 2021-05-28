//
//  Account.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// An authenticated user account representation
public struct Account: Codable {
    /// The unique identifier
    public let id: String

    /// The authenticated user email adress
    public let email: String

    /// The authenticated user projects
    public let projects: [Project]

    public init(id: String = UUID().uuidString, email: String, projects: [Project] = []) {
        self.id = id
        self.email = email
        self.projects = projects
    }
}

extension Account {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case email
        case projects
    }
}

extension Account: Identifiable {}

extension Account: CustomStringConvertible {
    public var description: String {
        "<Account id: \(id) email: \(email)>"
    }
}
