import Foundation


extension DateComponentsFormatter {

    public convenience init(style: DateComponentsFormatter.UnitsStyle) {
        self.init()
        self.unitsStyle = style
    }


    public func string(minutes: Int) -> String? {
        self.string(from: TimeInterval(minutes * 60))
    }

    public func string(minutes: Double) -> String? {
        self.string(from: TimeInterval(minutes * 60))
    }
}
