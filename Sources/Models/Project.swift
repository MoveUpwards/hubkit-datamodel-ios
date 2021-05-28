//
//  Project.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 26/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A container grouping a set of Session representing measurement campaigns.
public struct Project: Codable {
    /// The unique identifier
    public let id: String

    /// The project name
    public let name: String

    public init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}

extension Project {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case name
    }
}

extension Project: Identifiable {}

extension Project: CustomStringConvertible {
    public var description: String {
        "<Project id: \(id) name: \(name)>"
    }
}
