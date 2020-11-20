import Foundation

public extension Date {
  fileprivate static var formatter = DateFormatter()
  var timeStamp: String {
    let since = self.distance(to: Date())
    if self.isInToday {
      return DateFormatter.localizedString(from: self, dateStyle: .none, timeStyle: .short)
    } else if since < 3600 * 24 * 7 {
      return Date.formatter.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
    } else {
      return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
    }
  }
  var shortString: String {
    DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .short)
  }
  var shortDateString: String {
    DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
  }
  var fullTime: String {
    DateFormatter.localizedString(from: self, dateStyle: .none, timeStyle: .full)
  }
}
