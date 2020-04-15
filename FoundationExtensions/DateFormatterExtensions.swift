import Foundation


extension DateFormatter {

    public convenience init(dateFormat: String, timeZone: TimeZone = TimeZone.current) {
        self.init()
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }


    public convenience init(dateStyle: DateFormatter.Style, timeZone: TimeZone = TimeZone.current) {
        self.init()
        self.dateStyle = dateStyle
        self.timeZone = timeZone
    }


    public convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }

}
