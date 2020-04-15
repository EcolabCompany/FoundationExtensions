import Foundation

extension NumberFormatter {
    
    public convenience init(numberStyle: NumberFormatter.Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}

