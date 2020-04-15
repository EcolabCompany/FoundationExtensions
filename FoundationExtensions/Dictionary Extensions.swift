import Foundation


public enum DictionaryDecodingError: Error {
    case missingKey(AnyHashable), wrongType(Any.Type, AnyHashable)
}




extension Dictionary {

    public func decode<T: Any>(_ key: Key) throws -> T {
        guard self[key] != nil else { throw DictionaryDecodingError.missingKey(key) }
        guard let value = self[key] as? T else { throw DictionaryDecodingError.wrongType(T.self, key) }
        return value
    }

}
