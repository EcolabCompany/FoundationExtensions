import Foundation


precedencegroup PipeBackwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}


infix operator <|: PipeBackwardApplication

public func <| <A, B>(
    f: (A) -> B,
    a: A
) -> B {
    f(a)
}


public func <| <A, B>(
    f: (A) throws -> B,
    a: A
) throws -> B {
    try f(a)
}
