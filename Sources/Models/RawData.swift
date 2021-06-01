//
//  RawData.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// RawData represents the data captured by a Sensor
public struct RawData: Codable {
    /// The unique identifier
    public let id: UUID

    /// The device unique identifier the raw data come from
    public let device: UUID?

    /// The session unique identifier the raw data is associated with
    public let session: UUID?
}

extension RawData {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case device
        case session
    }
}

extension RawData: Identifiable {}

extension RawData: CustomStringConvertible {
    public var description: String {
        "<RawData id: \(id)>"
    }
}
