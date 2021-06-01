//
//  Activity.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// Activity represents an activity a session can be associated with
public struct Activity: Codable {
    /// The unique identifier
    public let id: UUID

    /// The activity name
    public let name: String
}

extension Activity {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case name
    }
}

extension Activity: Identifiable {}

extension Activity: CustomStringConvertible {
    public var description: String {
        "<Activity id: \(id) name: \(name)>"
    }
}
