import Foundation


extension Date {

    public static func date(fromISO601String string: String) -> Date? {
        return ISO8601DateFormatter().date(from: string)
    }


    public static func iso8601String(from date: Date) -> String {
        return ISO8601DateFormatter().string(from: date)
    }

    ///Returns an optional `NSDate` from a giving string with a specified date format.
    /// - parameter string: A date represented as a string.
    /// - parameter withDateFormat: The format the date is represented as.
    public static func dateFromString(_ string: String, withDateFormat: String) -> Date? {
        return DateFormatter(dateFormat: withDateFormat).date(from: string)
    }
    
    public static func date(from string: String, style: DateFormatter.Style) -> Date? {
        return DateFormatter(dateStyle: style).date(from: string)
    }


    ///Returns an optional `NSDate` from a giving string with a specified date format.
    /// - parameter string: A date represented as a string.
    /// - parameter format: The format the date is represented as.
    /// - parameter from: The time zone of the date
    public static func convert(_ string: String, format: String, from fromTimeZone: TimeZone) -> Date? {
        let dateFormatter = DateFormatter(dateFormat: format, timeZone: fromTimeZone)
        guard let fromDate = dateFormatter.date(from: string) else { return nil }
        let fromString = dateFormatter.string(from: fromDate)
        return dateFormatter.date(from: fromString)
    }

    
    ///Returns a string representation of the date with the givin `NSDateFormatterStyle`.
    /// - parameter dateStyle: The desired `NSDateFormatterStyle` to display the sting as.
    public func toString(dateStyle: DateFormatter.Style) -> String {
        return DateFormatter(dateStyle: dateStyle).string(from: self)
    }
    
    ///Returns a string representation of the date with the givin `NSDateFormatterStyle`.
    /// - parameter dateStyle: The desired `NSDateFormatterStyle` to display the sting as.
    public func toString(dateStyle: DateFormatter.Style, timeZone: TimeZone) -> String {
        return DateFormatter(dateStyle: dateStyle, timeZone: timeZone).string(from: self)
    }
    
    ///Returns a string representation of the date with the givin `NSDateFormatterStyle`.
    /// - parameter dateStyle: The desired `NSDateFormatterStyle` to display the date as.
    /// - parameter timeStyle: The desired `NSDateFormatterStyle` to display the time as.
    public func toString(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        return DateFormatter(dateStyle: dateStyle, timeStyle: timeStyle).string(from: self)
    }
    
    
    ///Returns a string representation of the date with the givin dateFormat.
    /// - parameter dateFormat: The desired format to display the date as.
     public func toString(dateFormat: String) -> String {
        return DateFormatter(dateFormat: dateFormat).string(from: self)
    }
}