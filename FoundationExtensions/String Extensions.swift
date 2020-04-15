import Foundation


extension String {

    public func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }


    public func trimNewLines() -> String {
        return self.trimmingCharacters(in: .newlines)
    }

}
