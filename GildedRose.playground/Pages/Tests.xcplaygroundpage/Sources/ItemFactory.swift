import Foundation

public class ItemFactory {
    public func createUpdatableItem(item: Item) -> UpdatableItem {
        switch item.name {

        case "Aged Brie":
            return AgedBrieItem(item: item)

        case "Sulfuras, Hand of Ragnaros":
            return SulfurasItem(item: item)

        case "Backstage passes to a TAFKAL80ETC concert":
            return BackstagePassItem(item: item)

        default:
            return NormalItem(item: item)
        }
    }
}
