import Foundation


extension Collection {

    public subscript (maybe index: Index) -> Iterator.Element? {
        guard startIndex <= index && index < endIndex else {
            return nil
        }
        return self[index]
    }

}

