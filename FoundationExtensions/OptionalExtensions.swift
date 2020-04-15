import Foundation


extension Optional where Wrapped == String {
    public var nilIfEmpty: String? {
        guard let self = self else { return nil }
        return self.isEmpty ? nil : self
    }
}
