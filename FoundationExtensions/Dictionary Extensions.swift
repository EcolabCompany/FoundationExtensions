import Foundation

extension Dictionary where Key == String, Value == Any {
  public func prettyPrint() -> String {
    guard
      let data = try? JSONSerialization.data(
        withJSONObject: self,
        options: [.sortedKeys, .withoutEscapingSlashes, .prettyPrinted]
      ) else {
        return ""
    }
    return String(decoding: data, as: UTF8.self)
  }
}
