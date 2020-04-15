import Foundation


extension String {

    public func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }


    public func trimNewLines() -> String {
        return self.trimmingCharacters(in: .newlines)
    }

    
    public func trimCharactersFromFront(_ characters: [Character]) -> String {
        var startingIndex: Index = self.startIndex
        for letter in self {
            if characters.contains(letter) {
                startingIndex = self.index(startingIndex, offsetBy: 1)
            } else {
                break
            }
        }
        return String(self.suffix(from: startingIndex))
    }


    public func trimCharactersFromEnd(_ characters: [Character]) -> String {
        var endingIndex: Index = self.endIndex
        for letter in self.reversed() {
            if characters.contains(letter) {
                endingIndex = self.index(endingIndex, offsetBy: -1)
            } else {
                break
            }
        }
        return String(self.prefix(upTo: endingIndex))
    }
    
}
