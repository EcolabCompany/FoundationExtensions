import Foundation


extension NSNumber {

    static public func + (lhs: NSNumber, rhs: NSNumber) -> NSNumber {
        NSNumber(value: lhs.floatValue + rhs.floatValue)
    }


    static public func - (lhs: NSNumber, rhs: NSNumber) -> NSNumber {
        NSNumber(value: lhs.floatValue - rhs.floatValue)
    }


    static public func > (lhs: NSNumber, rhs: NSNumber) -> Bool {
        lhs.compare(rhs) == .orderedDescending
    }


    static public func < (lhs: NSNumber, rhs: NSNumber) -> Bool {
        lhs.compare(rhs) == .orderedAscending
    }


    static public func >= (lhs: NSNumber, rhs: NSNumber) -> Bool {
        lhs.compare(rhs) == .orderedSame || lhs.compare(rhs) == .orderedDescending
    }


    static public func <= (lhs: NSNumber, rhs: NSNumber) -> Bool {
        lhs.compare(rhs) == .orderedSame || lhs.compare(rhs) == .orderedAscending
    }


    static public func + (lhs: NSNumber, rhs: Int) -> NSNumber {
        NSNumber(value: lhs.intValue + rhs)
    }

}
