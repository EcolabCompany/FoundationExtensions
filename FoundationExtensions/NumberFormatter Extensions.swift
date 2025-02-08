import Foundation

extension NumberFormatter {

  public convenience init(numberStyle: NumberFormatter.Style) {
    self.init()
    self.numberStyle = numberStyle
  }

  func string(from double: Double) -> String {
    string(from: NSNumber(value: double))!
  }

  func string(from double: Double?) -> String? {
    guard let value = double else { return nil }
    return string(from: NSNumber(value: value))!
  }
}

public let currencyFormatter = NumberFormatter()
  |> set(\.numberStyle, .currency)
  <> set(\.negativeFormat, "-¤#,##0.00")

public let percentFormatter = NumberFormatter()
  |> set(\.numberStyle, .percent)
