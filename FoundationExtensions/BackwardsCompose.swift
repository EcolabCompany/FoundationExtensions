import Foundation


precedencegroup BackwardsComposition {
    associativity: right
    higherThan: PipeForwardApplication, PipeBackwardApplication
}

infix operator <<<: BackwardsComposition

public func <<< <A, B, C>(g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C {
    return { x in
        g(f(x))
    }
}



public func <<< <A, B, C>(g: @escaping (B) throws -> C, f: @escaping (A) -> B) -> (A) throws -> C {
    return { x in
        try g(f(x))
    }
}
