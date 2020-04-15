import Foundation


public protocol EitherType {
    associatedtype A
    associatedtype B
    
    init(left: A)
    init(right: B)
    
    var left: A? { get }
    var right: B? { get }
    
}


public func ==<E: EitherType>(lhs: E, rhs: E) -> Bool where E.A: Equatable, E.B: Equatable {
    if let lhs = lhs.left, let rhs = rhs.left {
        return lhs == rhs
    } else if let lhs = lhs.right, let rhs = rhs.right {
        return lhs == rhs
    }
    return false
}


public enum Either<A, B>: EitherType {
    
    case left(A)
    case right(B)
    
    public init(left: A) {
        self = .left(left)
    }
    
    public init(right: B) {
        self = .right(right)
    }
    
    public var left: A? {
        switch self {
        case let .left(a):
            return a
        case .right:
            return nil
        }
    }
    
    public var right: B? {
        switch self {
        case .left:
            return nil
        case let .right(b):
            return b
        }
    }
    
}



extension Either where A == B {
    
    public var value: A {
        left ?? right!
    }
}
