import Foundation


public func filter<X>(_ f: @escaping (X) -> Bool) -> ([X]) -> [X] {
    return { xs in xs.filter(f) }
}


public func map<A, B>(_ f: @escaping (A) -> B) -> ([A]) -> [B] {
    return { xs in xs.map(f) }
}


public func compactMap<A, B>(_ f: @escaping (A) -> B?) -> ([A]) -> [B] {
    return { xs in xs.compactMap(f) }
}


public func flatMap<A, B>(_ f: @escaping (A) -> [B]) -> ([A]) -> [B] {
    return { xs in xs.flatMap(f) }
}


public func forEach<X>(_ f: @escaping (X) -> Void) -> ([X]) -> Void {
    return { xs in xs.forEach(f) }
}


public func reduce<X, Result>(_ initialValue: Result, nextPartialResult: @escaping (Result, X) -> Result) -> ([X]) -> Result {
    return { xs in
        xs.reduce(initialValue, { result, x in nextPartialResult(result, x) })
    }
}


public func reduce<Element, Result>(_ nextPartialResult: @escaping (Result, Element) -> Result) -> ([Element]) -> (Result) -> Result {
    return { array in
        return { result in
            array.reduce(result, nextPartialResult)
        }
    }
    
}
