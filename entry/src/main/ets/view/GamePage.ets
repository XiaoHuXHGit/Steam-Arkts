import { game_data_storage, game_media_storage } from '../data_storage/GameItemListStorage'
import { discount_price, Evaluation } from '../viewmodel/GameDataPeocess'
import {
  GameItem,
  GameData,
  GameMedia,
  get_game_data,
  get_game_media_data,
  get_media_image,
  get_video_cover
} from '../viewmodel/ShoppingPageResourceAcquisition'

@Component
export struct GamePage {
  // @State shopping_argparse: GameItem = {
  //   name: "底特律：化身为人",
  //   price: 128,
  //   current: 38,
  //   cover: "Detroit-Become-Human.jpg",
  //   isLive: false,
  //   code: "Detroit-Become-Human"
  // }
  @Link shopping_argparse: GameItem
  @State game_data: GameData = game_data_storage

  async aboutToAppear(): Promise<void> {
    // AppStorage.setOrCreate('server', 'http://127.0.0.1:7860')
    try {
      this.game_data = await get_game_data(this.shopping_argparse.code)
    } catch (error) {
      console.error('守岸人没找到游戏数据:', error)
    }
  }

  @Builder
  private Button_image() {
    Image('')
  }

  build() {
    Scroll() {
      Column() {
        Image(AppStorage.get('server') + '/CoverImageGet?cover=' + this.shopping_argparse.cover)
          .width('100%')
          .height('26%')
          .margin({ bottom: '3%' })
        Text(this.shopping_argparse.name)
          .fontColor('#FEFEFE')
          .fontSize('21.5vp')
          .fontWeight(FontWeight.Bold)
          .width('96%')
          .margin({ bottom: '3%' })
        Row() {
          Text('开发商')
            .fontColor('#8f98a1')
            .fontSize('13vp')
            .fontWeight(FontWeight.Normal)
            .margin({ right: '6%' })
          Text(this.game_data.developers)
            .fontColor('#6fc1f0')
            .fontSize('13vp')
            .fontWeight(FontWeight.Regular)
        }
        .width('96%')
        .margin({ bottom: '1.5%' })

        Row() {
          Text('发行商')
            .fontColor('#8f98a1')
            .fontSize('13vp')
            .fontWeight(FontWeight.Normal)
            .margin({ right: '6%' })
          Text(this.game_data.publishers)
            .fontColor('#6fc1f0')
            .fontSize('13vp')
            .fontWeight(FontWeight.Regular)
        }
        .width('96%')
        .margin({ bottom: '1.5%' })

        Row() {
          Text('发行日期')
            .fontColor('#8f98a1')
            .fontSize('13vp')
            .fontWeight(FontWeight.Normal)
            .margin({ right: '2.5%' })
          Text(this.game_data.release_date)
            .fontColor('#c6cfd8')
            .fontSize('13vp')
            .fontWeight(FontWeight.Regular)
        }
        .width('96%')
        .margin({ bottom: '4.5%' })

        Text(this.game_data.introduction)
          .fontColor('#c9d2db')
          .fontSize('14.2vp')
          .width('96%')
          .margin({ bottom: '5.2%' })

        Text('标签')
          .fontColor('#8e97a0')
          .fontSize('16vp')
          .width('96%')
          .margin({ bottom: '4.5%' })

        Row() {
          ForEach(this.game_data.tags, (item: string) => {
            Text(item)
              .fontColor('#6fc1f0')
              .fontSize('14vp')
              .fontWeight(FontWeight.Regular)
              .backgroundColor('#192939')
              .borderRadius('5%')
              .padding({
                top: '1.5%',
                bottom: '1.5%',
                left: '4%',
                right: '4%'
              })
              .margin({ left: '1.2%' })
          })
          Text('+')
            .fontColor('#6fc1f0')
            .fontSize('14vp')
            .fontWeight(FontWeight.Normal)
            .backgroundColor('#192939')
            .borderRadius('5%')
            .padding({
              top: '1.5%',
              bottom: '1.5%',
              left: '4%',
              right: '4%'
            })
            .margin({ left: '1.2%' })
            .onClick(() => {
              // 这里写加号的逻辑
            })
        }
        .width('98%')
        .margin({ bottom: '5.2%' })

        Text('评测')
          .fontColor('#8e97a0')
          .fontSize('16vp')
          .width('96%')
          .margin({ bottom: '4.5%' })

        Column() {
          evaluation_component({
            positive_appraise: this.game_data.positive_appraise,
            negative_appraise: this.game_data.negative_appraise,
            rating_time: '发布至今'
          })
            .margin({ bottom: '2%' })
          evaluation_component({
            positive_appraise: this.game_data.recent_positive_appraise,
            negative_appraise: this.game_data.recent_negative_appraise,
            rating_time: '最近'
          })
        }
        .margin({ bottom: '5.2%' })
        .padding('2.4%')
        .borderRadius('1.5%')
        .backgroundColor('#1b2838')
        .width('96%')

        GameMediaComponent({ shopping_argparse: this.shopping_argparse })
          .margin({ bottom: '5%' })

        Button('添加至您的愿望单', { type: ButtonType.Normal })
          .width('96%')
          .height('6%')
          .fontColor('#66C1F0')
          .fontSize('14vp')
          .backgroundColor('#233D4E')
          .borderRadius('0.4%')
          .margin({ bottom: '1.2%' })
          .onClick(() => {
            // 这里写添加愿望单的逻辑
          })
        Row() {
          Image($r('app.media.flag'))
            .backgroundColor('#233D4E')
            .borderRadius('0.4%')
            .height('100%')
            .margin({ right: '1.2%' })
            .padding({
              left: '14.5%',
              right: '14.5%',
              top: '2.6%',
              bottom: '2.6%'
            })
          Button('关注', { type: ButtonType.Normal })
            .fontColor('#66C1F0')
            .fontSize('14vp')
            .borderRadius('0.4%')
            .backgroundColor('#233D4E')
            .height('100%')
            .margin({ right: '1.2%' })
            .padding({
              left: '16%',
              right: '16%',
              top: '2.6%',
              bottom: '2.6%'
            })
          Row() {
            Button('忽略', { type: ButtonType.Normal })
              .fontColor('#66C1F0')
              .fontSize('14vp')
              .borderRadius('0.4%')
              .backgroundColor('#233D4E')
              .height('100%')
              .margin({ right: '1%' })
              .padding({
                left: '4%',
                right: '4%',
                top: '2.6%',
                bottom: '2.6%'
              })
          }
          .borderRadius('0.4%')
          .backgroundColor('#233D4E')
          .height('100%')
          .margin({ right: '0.6%' })

          Image($r('app.media.shopping_page_dropdown'))
            .backgroundColor('#233D4E')
            .borderRadius('0.4%')
            .height('100%')
            .padding({
              left: '2.5%',
              right: '2.5%',
              top: '4.4%',
              bottom: '4.4%'
            })
        }
        .height('6%')
        .width('96%')
        .margin({ bottom: '6%' })

        if (this.game_data.demo) {
          Column() {
            Row() {
              Text(`下载 ${this.game_data.name} Demo`)
                .fontColor(Color.White)
                .fontSize('16vp')
                .fontWeight(FontWeight.Normal)
                .margin({ left: '4%' })
              Image($r('app.media.windows_icon'))
                .width('5.4%')
                .margin({ right: '4%' })
            }
            .padding({ bottom: '3%' })
            .justifyContent(FlexAlign.SpaceBetween)
            .width('100%')
            .height('70%')
            .linearGradient({ angle: 90, colors: [[0x578422, 0.0], [0x3C5C1B, 1]] })
            .borderRadius('1%')

            Button('添加到库', { type: ButtonType.Normal })
              .position({ x: '73%', y: '52%' })
              .width('22.6%')
              .height('34%')
              .fontSize('14vp')
              .fontWeight(FontWeight.Normal)
              .borderRadius('3%')
              .padding({
                top: '1%',
                bottom: '1%',
                left: '2%',
                right: '2%'
              })
              .linearGradient({ angle: 90, colors: [[0x4F9DE4, 0.0], [0x2360C6, 1]] })
          }
          .width('96%')
          .height('15%')
        }
        Column() {
          Row() {
            Text(`购买 ${this.game_data.name}`)
              .fontColor(Color.White)
              .fontSize('16vp')
              .fontWeight(FontWeight.Normal)
              .margin({ left: '4%' })
            Image($r('app.media.windows_icon'))
              .width('5.4%')
              .margin({ right: '4%' })
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
          .margin({ top: '5.2%', bottom: '1.8%' })

          if (this.shopping_argparse.price != this.shopping_argparse.current) {
            Text('整周特惠! 11 月 26 日 截止')
              .width('96%')
              .fontColor('#86B5D1')
              .fontSize('14vp')
              .fontWeight(FontWeight.Normal)
              .margin({ left: '4%' })
          }

          GamePriceComponent({ gameItem: this.shopping_argparse })
            .align(Alignment.End)
            .width('100%')
            .margin({ top: '4%', right: '8%' })
        }
        .width('96%')
        .padding({ bottom: '4%' })
        .margin({ bottom: '10%' })
        .borderRadius('1.5%')
        .linearGradient({ angle: 90, colors: [[0x2F3942, 0.0], [0x4B555F, 1]] })

        Text('功能')
          .fontColor('#8e97a0')
          .fontSize('16vp')
          .width('96%')
          .margin({ bottom: '4.5%' })
        ForEach(this.game_data.function, (item: string) => {
          Row() {
            Row() {
              // 这里放图片，但我懒得放了
            }
            .backgroundColor('#0D141C')

          }
        })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#121b24')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .align(Alignment.Top)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}

@Component
struct evaluation_component {
  @Prop positive_appraise: number
  @Prop negative_appraise: number
  rating_time = ''
  evaluation_data: Evaluation = new Evaluation(this.positive_appraise, this.negative_appraise)

  build() {
    Row() {
      Text(this.evaluation_data.rating_string)
        .fontColor(this.evaluation_data.rating_color)
        .fontSize('15vp')
      Text(this.evaluation_data.evaluation_string() + this.rating_time)
        .fontColor('#8c98a6')
        .fontSize('15vp')
    }
    .width('100%')
  }
}

@Component
struct GameMediaComponent {
  @Prop shopping_argparse: GameItem
  @State game_media_list: GameMedia[] = game_media_storage
  @State game_media: GameMedia = game_media_storage[0]
  @State component_position: number = 0

  async aboutToAppear(): Promise<void> {
    try {
      this.game_media_list = await get_game_media_data(this.shopping_argparse.code)
      this.game_media_list.reverse()
    } catch (error) {
      console.error('守岸人没找到游戏数据:', error)
    }
    this.game_media = this.game_media_list[0]
  }

  build() {
    Column() {
      if (this.game_media.name != 'default') {
        preview_component({ code: this.shopping_argparse.code, game_media: this.game_media })
          .width('96%')
          .height('35%')
          .margin({ bottom: '1.5%' })
        Scroll() {
          Row() {
            // 写个框框的逻辑
            ForEach(this.game_media_list, (item: GameMedia) => {
              if (item.type == 'image') {
                Image(get_media_image(this.shopping_argparse.code, item))
                  .width('33%')
                  .height('12%')
                  .margin({ right: '1.5%' })
                  .onClick(() => {
                    this.game_media = item
                  })
              } else {
                Row() {
                  Image(get_video_cover(this.shopping_argparse.code, item))
                    .width('33%')
                    .height('12%')
                    .margin({ right: '1.5%' })
                  Image($r('app.media.rectangle_black'))
                    .width('13%')
                    .position({ x: '9.6%', y: '2%' })
                  Image($r('app.media.play'))
                    .width('7.6%')
                    .position({ x: '12.5%', y: '3.6%' })
                }
                .onClick(() => {
                  this.game_media = item
                })
              }
            })

          }
        }
        .width('96%')
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Horizontal)
      }
    }
  }
}

@Component
struct preview_component {
  @Prop game_media: GameMedia
  @Prop code: string

  public get_video() {
    return get_media_image(this.code, this.game_media)
  }

  build() {
    if (this.game_media.type == 'video') {
      Video({ src: this.get_video() })
    } else {
      Image(this.get_video())
    }
  }
}

@Component
struct GameMediaSelectComponent {
  @Prop component_position: number

  build() {
    Column() {
      Blank()
        .backgroundColor('#D7D7D9')
        .width('100%')
        .height('12%')
    }
  }
}

@Component
struct GamePriceComponent {
  @Prop gameItem: GameItem

  build() {
    Row() {
      Row() {
        Text(discount_price(this.gameItem))
          .fontColor('#B7EF14')
          .fontSize('16vp')
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#4B6B22')
          .padding({
            left: '1%',
            right: '1%',
            top: '1.5%',
            bottom: '1.5%'
          })
        Column() {
          Text(`￥${this.gameItem.price.toFixed(2)}`)
            .fontColor('#768797')
            .fontSize('12vp')
            .fontWeight(FontWeight.Normal)
            .decoration({ type: TextDecorationType.LineThrough, color: '#768797' })
          Text(`￥${this.gameItem.current.toFixed(2)}`)
            .fontColor('#B5E72F')
            .fontSize('12vp')
            .fontWeight(FontWeight.Normal)
        }
        .margin({ right: '1%' })
        .padding({ right: '2%' })
        .alignItems(HorizontalAlign.End)
        .backgroundColor('#344555')
      }

      Button('添加至购物车')
        .fontColor(Color.White)
        .fontSize('13vp')
        .type(ButtonType.Normal)
        .padding({ left: '3%', right: '3%' })
        .height('5%')
        .borderRadius('3%')
        .linearGradient({ angle: 90, colors: [[0x76B121, 0.0], [0x58891C, 1]] })
    }
    .padding('0.7%')
    .backgroundColor(Color.Black)
    .borderRadius('2%')
  }
}

// http://127.0.0.1:7860/GameMediaGet?code=Detroit-Become-Human&media_type=video&name=Detroit-Become-Human_Opening_Theme.mp4
