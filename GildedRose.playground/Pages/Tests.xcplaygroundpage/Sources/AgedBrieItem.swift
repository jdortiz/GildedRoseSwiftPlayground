import Foundation

public struct AgedBrieItem {
    let item: Item
    public init(item: Item) {
        self.item = item
    }

    public func update() -> Item {
        var updatedItem = item.changeSellIn(increment: -1)
        if updatedItem.sellIn < 0 {
            updatedItem = updatedItem.changeQuality(increment: +2).limitQualityTo(max: 50)
        } else {
            updatedItem = updatedItem.changeQuality(increment: +1).limitQualityTo(max: 50)
        }
        return updatedItem
    }
}
