import Foundation


extension Array {
    
    public func replace(where f:(Element) -> Bool, with g: (Element) -> Element) -> [Element] {
        var array: [Element] = []
        for e in self {
            if f(e) == true {
                array.append(g(e))
            } else {
                array.append(e)
            }
        }
        return array
    }
    
    public func reduce<Result>(_ nextPartialResult: @escaping (Result, Element) -> Result) -> (Result) -> Result {
        { result in
            self.reduce(result, nextPartialResult)
        }
    }
}
