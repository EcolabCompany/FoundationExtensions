import Foundation


public extension Sequence {

    func toDictionary<K: Hashable & Equatable>(by keyForValue: (Self.Element) -> K) -> [K:[Self.Element]] {
        return Dictionary(grouping: self, by: keyForValue)
    }

    func contains(_ f: (Element) -> Bool) -> Bool {
        for e in self {
            if f(e) == true {
                return true
            }
        }
        return false
    }

}




public extension Sequence where Iterator.Element: Hashable {

    func unique() -> [Iterator.Element] {
      self.reduce(into: [Element]()) { partialResult, element in
        if !partialResult.contains(element) {
          partialResult.append(element)
        }
      }
    }

 
    func unique<T:Hashable>(by: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered: [Element] = [] //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(by(value)) {
                set.insert(by(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered
    }
    
}




public extension Sequence where Iterator.Element: Equatable {

    func unique() -> [Iterator.Element] {
        return self.reduce([]) { uniqueElements, element in
            uniqueElements.contains(element) ? uniqueElements : uniqueElements + [element]
        }
    }

}
