//
//  Session.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A measurement campaign over a given time interval with one or more Devices
public struct Session: Codable {
    /// The unique identifier
    public let id: UUID

    /// The state ot the session
    public let state: String?

    /// The project unique identifier the session is linked to
    public let project: UUID?

    /// The project unique identifier the session is linked to
    public let metas: String?

    /// The session captured date
    public let duration: TimeInterval?

    /// The session start captured date
    public let startCapturedDate: Date?

    /// The session stop captured date
    public let endCapturedDate: Date?
}

extension Session {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case state, project, metas, duration
        case startCapturedDate, endCapturedDate
    }
}

extension Session: Identifiable {}

extension Session: CustomStringConvertible {
    public var description: String {
        "<Session id: \(id) duration: \(String(describing: duration))>"
    }
}
