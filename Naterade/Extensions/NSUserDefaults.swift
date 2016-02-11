//
//  NSUserDefaults.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 8/30/15.
//  Copyright © 2015 Nathan Racklyeft. All rights reserved.
//

import Foundation
import LoopKit


extension NSUserDefaults {

    private enum Key: String {
        case BasalRateSchedule = "come.loudnate.Naterade.BasalRateSchedule"
        case ConnectedPeripheralIDs = "com.loudnate.Naterade.ConnectedPeripheralIDs"
        case PumpID = "com.loudnate.Naterade.PumpID"
        case TransmitterID = "com.loudnate.Naterade.TransmitterID"
        case TransmitterStartTime = "comm.loudnate.Naterade.TransmitterStartTime"
    }

    var basalRateSchedule: BasalRateSchedule? {
        get {
            if let rawValue = dictionaryForKey(Key.BasalRateSchedule.rawValue) {
                return BasalRateSchedule(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.BasalRateSchedule.rawValue)
        }
    }

    var connectedPeripheralIDs: [String] {
        get {
            return arrayForKey(Key.ConnectedPeripheralIDs.rawValue) as? [String] ?? []
        }
        set {
            setObject(newValue, forKey: Key.ConnectedPeripheralIDs.rawValue)
        }
    }

    var pumpID: String? {
        get {
            return stringForKey(Key.PumpID.rawValue)
        }
        set {
            setObject(newValue, forKey: Key.PumpID.rawValue)
        }
    }

    var transmitterStartTime: NSTimeInterval? {
        get {
            return doubleForKey(Key.TransmitterStartTime.rawValue)
        }
        set {
            if let value = newValue {
                setDouble(value, forKey: Key.TransmitterStartTime.rawValue)
            } else {
                setNilValueForKey(Key.TransmitterStartTime.rawValue)
            }
        }
    }

    var transmitterID: String? {
        get {
            return stringForKey(Key.TransmitterID.rawValue)
        }
        set {
            setObject(newValue, forKey: Key.TransmitterID.rawValue)
        }
    }

}