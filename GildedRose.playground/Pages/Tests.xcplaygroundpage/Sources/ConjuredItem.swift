import Foundation

public struct ConjuredItem {
    let item: Item
    public init(item: Item) {
        self.item = item
    }
}

extension ConjuredItem: UpdatableItem {
    public func update() -> Item {
        var updatedItem = item.changeSellIn(increment: -1)
        if updatedItem.sellIn >= 0 {
            updatedItem = updatedItem.changeQuality(increment: -2).limitQualityTo(min: 0)
        } else {
            updatedItem = updatedItem.changeQuality(increment: -4).limitQualityTo(min: 0)
        }
        return updatedItem
    }
}
