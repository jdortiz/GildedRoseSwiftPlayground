import Foundation

public extension Item {
    func changeSellIn(increment: Int) -> Item {
        return Item(name: name, sellIn: sellIn + increment, quality: quality)
    }

    func changeQuality(increment: Int) -> Item {
        return Item(name: name, sellIn: sellIn, quality: quality + increment)
    }

    func limitQualityTo(min: Int) -> Item {
        if quality >= min {
            return self
        } else {
            return Item(name: name, sellIn: sellIn, quality: min)
        }
    }

    func limitQualityTo(max: Int) -> Item {
        if quality <= max {
            return self
        } else {
            return Item(name: name, sellIn: sellIn, quality: max)
        }
    }
}


public class GildedRose {
    public var items:[Item]

    required public init(items:[Item]) {
        self.items = items
    }

    public func updateQuality() {
        for i in 0..<items.count {

            switch items[i].name {

            case "Aged Brie":
                items[i] = AgedBrieItem(item: items[i]).update()

            case "Sulfuras, Hand of Ragnaros":
                items[i] = SulfurasItem(item: items[i]).update()

            case "Backstage passes to a TAFKAL80ETC concert":
                items[i] = BackstagePassItem(item: items[i]).update()

            default:
                items[i] = NormalItem(item: items[i]).update()
            }
        }
    }
}
