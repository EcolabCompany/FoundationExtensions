import Foundation


precedencegroup FailableComposition {
    associativity: left
    higherThan: PipeForwardApplication
}

infix operator >=>: FailableComposition


public func >=> <A, B, C> (
    f: @escaping (A) -> B?,
    g: @escaping (B) -> C?
) -> (A) -> C? {
    { a in
        guard let b = f(a) else { return nil }
        return g(b)
    }
}


public func >=> <A, B, C> (
    f: @escaping (A) -> B,
    g: @escaping (B) -> C?
) -> (A) -> C? {
    { a in g(f(a)) }
}


public func >=> <A, B, C> (
    f: @escaping (A) -> B?,
    g: @escaping (B) -> C
) -> (A) -> C? {
    { a in
        guard let b = f(a) else { return nil }
        return g(b)
    }
}


public func >=> <A, B, C> (
    f: @escaping (A) throws -> B,
    g: @escaping (B) -> C
) -> (A) throws -> C {
    { a in g(try f(a)) }
}
