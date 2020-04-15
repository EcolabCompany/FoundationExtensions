import Foundation


precedencegroup SingleTypeComposition {
    associativity: left
    higherThan: PipeForwardApplication
}


infix operator <>: SingleTypeComposition


public func <> <A>(
    f: @escaping (A) -> A,
    g: @escaping (A) -> A
) -> (A) -> A {
    f >>> g
}


public func <> <A>(
    f: @escaping (A) -> Void,
    g: @escaping (A) -> Void
) -> (A) -> Void {
    { a in
        f(a)
        g(a)
    }
}


public func <> (
    f: @escaping () -> Void,
    g: @escaping () -> Void
) -> () -> Void {
    {
        f()
        g()
    }
}


public func <> <A> (
    f: @escaping (inout A) -> Void,
    g: @escaping (inout A) -> Void
) -> (inout A) -> Void {
    { a in
        f(&a)
        g(&a)
    }
}

