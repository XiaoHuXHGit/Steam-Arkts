import { discount_price } from '../viewmodel/GameDataPeocess';
import { SpecialOfferGameItem, game_price_process } from '../viewmodel/GameItemProcess'
import { GameItem, get_recommend_game_items } from '../viewmodel/ShoppingPageResourceAcquisition';

@Component
export struct ShoppingContent {
  @State recommendGameItems: GameItem[] = [];
  @Link shopping: boolean
  @Link shopping_argparse: GameItem

  aboutToAppear() {
    this.fetchRecommendGameItems();
  }

  private async fetchRecommendGameItems() {
    try {
      const gameItems: GameItem[] = await get_recommend_game_items();
      this.recommendGameItems = gameItems;
    } catch (error) {
      console.error('获取推荐游戏列表失败:', error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Image($r('app.media.wuthering_wave_tsubaki'))
          .width('100%')
          .height('45.6%')
          .margin({ bottom: '6.7%' })
        Text('精选和推荐')
          .width('96%')
          .fontColor(Color.White)
          .fontSize('14vp')
          .margin({ bottom: '2.3%' })
        Scroll() {
          Row() {
            ForEach(this.recommendGameItems, (item: GameItem) => {
              feature_and_recommend({ gameItem: item })
                .onClick(() => {
                  this.shopping_argparse = item
                  this.shopping = true
                })
            })
          }
          .margin({ bottom: '8%' })
        }
        .width('96%')
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.On)
        .scrollBarColor('#424953')
        .align(Alignment.Top)
        .margin({ bottom: '6%' })

        Column() {
          // 这个是一个图片
          Image($r('app.media.wuthering_wave_tsubaki'))
            .width('96%')
            .height('19%')
            .margin({ top: '6%', bottom: '11%' })
          // 特别优惠的内容
          Row() {
            Text('特别优惠')
              .fontColor(Color.White)
              .fontSize('13vp')
            Row() {
              Text('更多')
                .fontColor('#8a909c')
                .fontSize('12vp')
              Image($r('app.media.main_page_more_gray'))
                .width('5%')
            }
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('96%')
          .margin({ bottom: '2.3%' })

          Scroll() {
            Row() {
              ForEach(this.recommendGameItems, (item: GameItem) => {
                special_offer()
              })
            }
            .margin({ bottom: '8%' })
          }
          .width('96%')
          .scrollable(ScrollDirection.Horizontal)
          .scrollBar(BarState.On)
          .scrollBarColor('#424953')
          .align(Alignment.Top)
          .margin({ bottom: '8%' })
        }
        .width('100%')
        .backgroundColor('#19283b')
      }
    }
    .width('100%')
    .linearGradient({ angle: 180, colors: [[0x192a3c, 0.0], [0x213f5b, 1]] })
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .align(Alignment.Top)
  }
}

@Component
struct feature_and_recommend {
  gameItem: GameItem = {
    name: 'name',
    price: 0.00,
    current: 0.00,
    cover: '',
    isLive: false,
    code: 'code'
  }
  @State cover: string = AppStorage.get('server') + '/CoverImageGet' + '?cover=' + this.gameItem.cover

  build() {
    Column() {
      Image(AppStorage.get('server') + '/CoverImageGet' + '?cover=' + this.gameItem.cover)
        .width('100%')
        .height('32.5%')
      Column() {

        Text(this.gameItem.name)
          .width('96.5%')
          .fontColor(Color.White)
          .fontSize('18.6vp')
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.MARQUEE })
          .margin({ top: '2%' })
        if (this.gameItem.current == this.gameItem.price) {
          Text(game_price_process(this.gameItem.price))
            .width('92%')
            .fontColor(Color.White)
            .fontSize('11.2vp')
            .fontWeight(FontWeight.Normal)
            .margin({ top: '2.6%' })
        } else {
          Row() {
            Row() {
              Row() {
                Text(discount_price(this.gameItem))
                  .fontColor('#bfee12')
                  .fontSize('14vp')
                  .margin({
                    left: '1.5%',
                    top: '0.5%',
                    bottom: '0.5%',
                    right: '1.5%'
                  })
              }
              .backgroundColor('#4b6b22')

              Text(game_price_process(this.gameItem.price))
                .fontColor('#748795')
                .fontSize('11.2vp')
                .fontWeight(FontWeight.Normal)
                .decoration({ type: TextDecorationType.LineThrough, color: Color.Gray })
                .margin({ left: '2%', top: '1%', bottom: '1%' })
              Text(game_price_process(this.gameItem.current))
                .fontColor('#beed11')
                .fontSize('11.2vp')
                .fontWeight(FontWeight.Normal)
                .margin({ top: '1%', right: '2%', bottom: '1%' })
            }
            .backgroundColor('#344654')
          }
          .width('96%')
          .height('60%')
        }
      }
      .width('100%')
      .height('13.6%')
      .linearGradient({ angle: 180, colors: [[0x0a141d, 0.0], [0x1c364f, 0.93], [0x0c1f30, 0.94], [0x213f5b, 1]] })
    }
    .width('90%')
    .margin({ right: '3%' })
  }
}

@Preview
@Component
struct special_offer {
  build() {
    Column() {

    }
    .width('90%')
    .height('40%')
  }
}