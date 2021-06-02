//
//  AlgorithmType.swift
//
//
//  Created by lgriffie on 02/06/2021.
//

import Foundation
import TibtopModelCore

public enum AlgorithmType {
    public enum SensorType: String {
        case gps, imu
    }

    public enum TimelineType {
        case speed(sensor: SensorType), position
    }

    // IPPT (https://iptt.algo.tibtop-connect.com/sessions/iptt)
    case ippt

    // STATS based on GPS sensor (https://gps.algo.tibtop-connect.com/sessions/gps)
    // STATS stats based on IMU sensor (https://imu.algo.tibtop-connect.com/sessions/imu)
    case sessions(sensor: SensorType)


    // TIMELINE speeds bases on GPS sensor (https://gps.algo.tibtop-connect.com/trim/speed)
    // TIMELINE speeds bases on IMU sensor (https://imu.algo.tibtop-connect.com/trim/speed)
    // TIMELINE positions bases on GPS sensor (https://gps.algo.tibtop-connect.com/trim/gps)
    case timeline(type: TimelineType)

    public var algorithm: String {
        switch self {
        case .ippt: return "iptt-algo-go"
        case .sessions(let sensor):
            switch sensor {
            case .gps: return "gps-algo-go"
            case .imu: return "imu-algo-go"
            }
        case .timeline(let type):
            switch type {
            case .position: return "gps-algo-go-trim"
            case .speed(let sensor):
                switch sensor {
                case .gps: return "gps-algo-go-trim-speed"
                case .imu: return "imu-algo-go-trim"
                }
            }
        }
    }

    public var dataType: String {
        switch self {
        case .sessions(let sensor): return sensor.rawValue
        case .timeline(let type):
            switch type {
            case .position: return "gps"
            case .speed(let sensor): return sensor.rawValue
            }
        case .ippt: return ""
        }
    }
}

// MARK: Ippt Input

extension AlgorithmType {
    public struct Ippt: Codable {
        public let position: PlayerPosition
        public let category: PlayerCategory

        public let start: TimeInterval?
        public let end: TimeInterval?

        public let distance: Double
        public let sprintDistance: Double

        public let paceNotMoving: Double
        public let paceWalking: Double
        public let paceRunning: Double
        public let paceSprinting: Double

        public let sprintLowCount: Double
        public let sprintMediumCount: Double
        public let sprintHighCount: Double

        enum CodingKeys: String, CodingKey {
            case position = "player_position"
            case category = "player_category"
            case start, end
            case distance = "total_distance"
            case sprintDistance = "sprint_high_total_distance"
            case paceNotMoving, paceWalking, paceRunning, paceSprinting
            case sprintLowCount, sprintMediumCount, sprintHighCount
        }

        public init(
            category: PlayerCategory,
            position: PlayerPosition,
            start: TimeInterval?,
            end: TimeInterval?,
            distance: Double,
            sprintDistance: Double,
            paceNotMoving: Double,
            paceWalking: Double,
            paceRunning: Double,
            paceSprinting: Double,
            sprintLowCount: Double,
            sprintMediumCount: Double,
            sprintHighCount: Double
        ) {
            self.category = category
            self.position = position
            self.start = start
            self.end = end
            self.distance = distance
            self.sprintDistance = sprintDistance
            self.paceNotMoving = paceNotMoving
            self.paceWalking = paceWalking
            self.paceRunning = paceRunning
            self.paceSprinting = paceSprinting
            self.sprintLowCount = sprintLowCount
            self.sprintMediumCount = sprintMediumCount
            self.sprintHighCount = sprintHighCount
        }
    }
}

// MARK: Session Input

extension AlgorithmType {
    public struct Session: Codable {
        public let category: PlayerCategory
        public let coordinates: String

        public let start: TimeInterval?
        public let end: TimeInterval?

        enum CodingKeys: String, CodingKey {
            case category = "player_category"
            case coordinates = "field_coords"
            case start, end
        }

        public init(category: PlayerCategory, coordinates: String, start: TimeInterval?, end: TimeInterval?) {
            self.category = category
            self.coordinates = coordinates
            self.start = start
            self.end = end
        }
    }
}

// MARK: Timeline Input

extension AlgorithmType {
    public struct Timeline: Codable {
        public let category: PlayerCategory

        public let start: TimeInterval?
        public let end: TimeInterval?

        enum CodingKeys: String, CodingKey {
            case category = "player_category"
            case start, end
        }

        public init(category: PlayerCategory, start: TimeInterval?, end: TimeInterval?) {
            self.category = category
            self.start = start
            self.end = end
        }
    }
}
