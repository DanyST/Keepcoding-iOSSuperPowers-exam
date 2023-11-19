import Foundation

enum Status {
    case none
    case loading
    case loaded
    case error(error: String?)
}
