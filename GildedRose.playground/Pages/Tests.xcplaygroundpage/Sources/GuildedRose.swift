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
                items[i] = items[i].changeSellIn(increment: -1)
                if items[i].sellIn < 0 {
                    items[i] = items[i].changeQuality(increment: +2).limitQualityTo(max: 50)
                } else {
                    items[i] = items[i].changeQuality(increment: +1).limitQualityTo(max: 50)
                }

            case "Sulfuras, Hand of Ragnaros":
                break

            case "Backstage passes to a TAFKAL80ETC concert":
                items[i] = items[i].changeSellIn(increment: -1)
                switch items[i].sellIn {
                case 10..<Int.max:
                    items[i] = items[i].changeQuality(increment: +1).limitQualityTo(max: 50)
                case 5..<10:
                    items[i] = items[i].changeQuality(increment: +2).limitQualityTo(max: 50)
                case 0..<5:
                    items[i] = items[i].changeQuality(increment: +3).limitQualityTo(max: 50)
                default: // case Int.min..<0:
                    items[i] = items[i].limitQualityTo(max: 0)
                }

            default:
                items[i] = items[i].changeSellIn(increment: -1)
                if items[i].sellIn >= 0 {
                    items[i] = items[i].changeQuality(increment: -1).limitQualityTo(min: 0)
                } else {
                    items[i] = items[i].changeQuality(increment: -2).limitQualityTo(min: 0)
                }
            }
        }
    }
}
