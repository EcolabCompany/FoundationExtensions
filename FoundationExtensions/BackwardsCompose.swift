import Foundation


precedencegroup BackwardsComposition {
    associativity: right
    higherThan: PipeForwardApplication, PipeBackwardApplication
}

infix operator <<<: BackwardsComposition

public func <<< <A, B, C>(
    g: @escaping (B) -> C,
    f: @escaping (A) -> B
) -> (A) -> C {
    { x in
        g(f(x))
    }
}



public func <<< <A, B, C>(
    g: @escaping (B) throws -> C,
    f: @escaping (A) -> B
) -> (A) throws -> C {
    { x in
        try g(f(x))
    }
}
