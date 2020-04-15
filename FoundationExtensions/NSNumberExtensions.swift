import Foundation


extension NSNumber {

    static public func + (lhs: NSNumber, rhs: NSNumber) -> NSNumber {
        return NSNumber(value: lhs.floatValue + rhs.floatValue)
    }


    static public func - (lhs: NSNumber, rhs: NSNumber) -> NSNumber {
        return NSNumber(value: lhs.floatValue - rhs.floatValue)
    }


    static public func > (lhs: NSNumber, rhs: NSNumber) -> Bool {
        return lhs.compare(rhs) == .orderedDescending
    }


    static public func < (lhs: NSNumber, rhs: NSNumber) -> Bool {
        return lhs.compare(rhs) == .orderedAscending
    }


    static public func >= (lhs: NSNumber, rhs: NSNumber) -> Bool {
        return lhs.compare(rhs) == .orderedSame || lhs.compare(rhs) == .orderedDescending
    }


    static public func <= (lhs: NSNumber, rhs: NSNumber) -> Bool {
        return lhs.compare(rhs) == .orderedSame || lhs.compare(rhs) == .orderedAscending
    }


    static public func + (lhs: NSNumber, rhs: Int) -> NSNumber {
        return NSNumber(value: lhs.intValue + rhs)
    }

}
