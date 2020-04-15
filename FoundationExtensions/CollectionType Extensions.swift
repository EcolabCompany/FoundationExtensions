import Foundation


extension Collection {

    ///Safely returns an `Optional` Element from a given index. Returns nil f the index is out of bounds.
    public subscript (maybe index: Index) -> Iterator.Element? {
        guard startIndex <= index && index < endIndex else { return nil }
        return self[index]
    }

}

