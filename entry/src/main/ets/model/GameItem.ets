export interface GameItem {
  // 游戏名称
  name: string;
  // 游戏的原价
  price: number;
  // 游戏的现价
  current: number;
  // 游戏的封面(是个地址，访问服务器的)
  cover: string;
  // 看看开发商有没有在直播
  isLive: boolean;
  // 游戏数据获取的识别码
  code: string;
}

export interface SpecialOfferGameItem extends GameItem {
  /*
  是否是合集
  如果是合集，那么就显示合集的名字
   */
  isCollection: boolean
  // 截止时间
  deadline: string
  // 隐藏价格
  hidePrice: boolean
}