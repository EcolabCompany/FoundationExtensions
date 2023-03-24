import Foundation

extension Double {

  public func limit(intLength: Int, decimalLength: Int) -> Self {
    let separator = NumberFormatter().decimalSeparator.first!
    let text = String(describing: self)
    if let decimalIndex = text.firstIndex(of: separator) {
      let intValue = text[..<decimalIndex].prefix(intLength)
      let decimalValue = text[decimalIndex...].dropFirst().prefix(decimalLength)
      return Double("\(intValue).\(decimalValue)")!
    } else {
      return Double("\(text.prefix(intLength))")!
    }
  }
  
}
