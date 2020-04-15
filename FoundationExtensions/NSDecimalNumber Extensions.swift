import Foundation


extension NSDecimalNumber {
    
    public func round(places: Int16) -> NSDecimalNumber {
        self.rounding(accordingToBehavior: NSDecimalNumberHandler(
            roundingMode: .plain,
            scale: places,
            raiseOnExactness: true,
            raiseOnOverflow: true,
            raiseOnUnderflow: true,
            raiseOnDivideByZero: true))
    }
}
