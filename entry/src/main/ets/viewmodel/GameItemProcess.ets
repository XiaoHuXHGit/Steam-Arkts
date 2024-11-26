import { SpecialOfferGameItem } from '../model/GameItem'

export function game_price_process(price: number) {
  return price == 0 ? '免费开玩' : '￥' + price.toString()
}

export { SpecialOfferGameItem }