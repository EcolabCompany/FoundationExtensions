import Foundation


precedencegroup PipeForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}


infix operator |>: PipeForwardApplication

public func |> <A, B>(a: A, f: (A) -> B) -> B {
    return f(a)
}

public func |> <A, B>(a: A, f: (A) throws -> B) throws -> B {
    return try f(a)
}


public func |> <A, B>(a: A?, f: (A) -> B) -> B? {
    guard let a = a else { return nil }
    return f(a)
}

public func |> <A, B>(a: A?, f: (A) -> B?) -> B? {
    guard let a = a else { return nil }
    return f(a)
}


public func |><A> (_ a: A, _ f: (inout A) -> Void) -> A {
    var a = a
    f(&a)
    return a
}

precedencegroup PipeBackwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}


infix operator <|: PipeBackwardApplication

public func <| <A, B>(f: (A) -> B, a: A) -> B {
    return f(a)
}


public func <| <A, B>(f: (A) throws -> B, a: A) throws -> B {
    return try f(a)
}
