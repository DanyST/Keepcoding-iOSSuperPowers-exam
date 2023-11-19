import Foundation

struct ModelDataContainer<T> {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [T]
}
