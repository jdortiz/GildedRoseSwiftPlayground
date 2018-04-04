import Foundation

public struct NormalItem {
    let item: Item
    public init(item: Item) {
        self.item = item
    }

    public func update() -> Item {
        var updatedItem = item.changeSellIn(increment: -1)
        if updatedItem.sellIn >= 0 {
            updatedItem = updatedItem.changeQuality(increment: -1).limitQualityTo(min: 0)
        } else {
            updatedItem = updatedItem.changeQuality(increment: -2).limitQualityTo(min: 0)
        }
        return updatedItem
    }
}
