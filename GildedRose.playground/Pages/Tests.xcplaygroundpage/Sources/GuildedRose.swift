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
        let factory = ItemFactory()
        for i in 0..<items.count {
            items[i] = factory.createUpdatableItem(item: items[i]).update()
        }
    }
}
