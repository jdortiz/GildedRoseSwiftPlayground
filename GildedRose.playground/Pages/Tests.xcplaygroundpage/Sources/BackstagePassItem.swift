import Foundation

public struct BackstagePassItem {
    let item: Item
    public init(item: Item) {
        self.item = item
    }
}

extension BackstagePassItem: UpdatableItem {
    public func update() -> Item {
        var updatedItem = item.changeSellIn(increment: -1)
        switch updatedItem.sellIn {
        case 10..<Int.max:
            updatedItem = updatedItem.changeQuality(increment: +1).limitQualityTo(max: 50)
        case 5..<10:
            updatedItem = updatedItem.changeQuality(increment: +2).limitQualityTo(max: 50)
        case 0..<5:
            updatedItem = updatedItem.changeQuality(increment: +3).limitQualityTo(max: 50)
        default: // case Int.min..<0:
            updatedItem = updatedItem.limitQualityTo(max: 0)
        }
        return updatedItem
    }
}
