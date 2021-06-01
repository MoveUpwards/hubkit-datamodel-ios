//
//  Device.swift
//  HubKit
//
//  Created by Damien Noël Dubuisson on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A physical device containing a set of electronic components for measurements (Sensors)
public struct Device: Codable {
    /// The unique identifier
    public let id: UUID

    /// The name of the device
    public let externalUUID: UUID?

    /// The name of the device
    public let name: String?

    /// The MAC address of the device
    public let macAddress: String?

    /// The hardware version of the device
    public let hardwareVersion: String?

    /// The firmware version of the device
    public let firmwareVersion: String?

    /// Is the device start recording data manually
    public let manualMode: Bool

    /// The latitude of the device position
    public let latitude: Double?

    /// The longitude of the device position
    public let longitude: Double?

    /// The device type
    public let sensorType: String?

    /// The device battery level in percentile
    public let battery: Int?

    /// Is the device being activated
    public let activated: Bool

    /// The device activation date
    public let activatedAt: Date?
}

extension Device {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case externalUUID = "externalIdentifier"
        case name
        case macAddress
        case hardwareVersion
        case firmwareVersion
        case manualMode
        case latitude
        case longitude
        case sensorType
        case battery
        case activated
        case activatedAt = "activatedAt"
    }
}

extension Device: Identifiable {}

extension Device: CustomStringConvertible {
    public var description: String {
        "<Device id: \(id) activated: \(activated)>"
    }
}
