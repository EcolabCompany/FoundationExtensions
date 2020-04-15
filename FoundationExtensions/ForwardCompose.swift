import Foundation


precedencegroup ForwardComposition {
    associativity: left
    higherThan: PipeForwardApplication, PipeBackwardApplication, BackwardsComposition, FailableComposition, SingleTypeComposition
}


infix operator >>>: ForwardComposition


public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { a in g(f(a)) }
}
