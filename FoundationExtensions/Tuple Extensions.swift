import Foundation


///Returns the first element of a tuple
public func first<A, B>(_ x: (A, B)) -> A {
    return x.0
}


///Returns the second element of a tuple
public func second<A, B>(_ x: (A, B)) -> B {
    return x.1
}
