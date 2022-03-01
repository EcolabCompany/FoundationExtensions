import Foundation


public func compactMap<A, B>(_ f: @escaping (A) -> B?) -> ([A]) -> [B] {
    { xs in xs.compactMap(f) }
}


public func filter<X>(_ f: @escaping (X) -> Bool) -> ([X]) -> [X] {
  { xs in xs.filter(f) }
}


public func flatMap<A, B>(_ f: @escaping (A) -> [B]) -> ([A]) -> [B] {
    { xs in xs.flatMap(f) }
}


public func forEach<X>(_ f: @escaping (X) -> Void) -> ([X]) -> Void {
    { xs in xs.forEach(f) }
}


public func map<A, B, S: Sequence>(_ f: @escaping (A) -> B) -> (S) -> [B] where S.Element == A {
  { xs in xs.map(f) }
}

public func reduce<X, Result>(
    _ initialValue: Result,
    nextPartialResult: @escaping (Result, X) -> Result
) -> ([X]) -> Result {
    { xs in
        xs.reduce(initialValue, { result, x in nextPartialResult(result, x) })
    }
}


public func reduce<Element, Result>(_ nextPartialResult: @escaping (Result, Element) -> Result) -> ([Element]) -> (Result) -> Result {
    { array in
        { result in
            array.reduce(result, nextPartialResult)
        }
    }
}


public func reduce<X, Result>(
  into initialResult: Result,
  _ updateAccumulatingResult: @escaping (inout Result, X) -> ()) -> ([X])-> Result {
    { xs in
      xs.reduce(into: initialResult, updateAccumulatingResult)
    }
  }


public func sorted<S: Sequence>(by areInIncreasingOrder: @escaping (S.Element, S.Element) -> Bool) -> (S) -> [S.Element] {
  { xs in
    xs.sorted(by: areInIncreasingOrder)
  }
}
