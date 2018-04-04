import Foundation

public struct SulfurasItem {
    let item: Item
    public init(item: Item) {
        self.item = item
    }

    public func update() -> Item {
        return item
    }
}
