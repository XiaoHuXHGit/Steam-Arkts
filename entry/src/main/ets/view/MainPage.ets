import { ShoppingPage } from './ShoppingPage';
import { TokenPage } from './TokenPage';

@Entry
@Component
export struct MainPage {
  @State index: number = 0; // 选项卡下标，默认为第一个
  @State color: string = '#ededed';
  @State title: string = 'empty'
  @State shopping: boolean = false

  @Builder
  toolbar() { // 通过builder自定义toolbar
    Row() {
      Line()
        .linearGradient({ angle: 90, colors: [[0x3aa0ff, 0.0], [0x3377fc, 0.7]] })
        .width('16%')
        .height('3%')
        .position({ x: `${this.index * 20 + 2}%`})
      Column() {
        Image(this.index == 0 ? $r('app.media.main_page_shop_selected') : $r('app.media.main_page_shop'))
          .size({ width: 25, height: 25 })
      }
      .padding({top: '7%'})
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .layoutWeight(1)
      .onClick(() => {
        this.index = 0;
        this.shopping = false
      })

      Column() {
        Image(this.index == 1 ? $r('app.media.main_page_news_selected') : $r('app.media.main_page_news'))
          .size({ width: 30, height: 30 })
      }
      .padding({top: '6.4%'})
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .layoutWeight(1)
      .onClick(() => {
        this.index = 1;
        this.shopping = false
      })

      Column() {
        Image(this.index == 2 ? $r('app.media.main_page_token_selected') : $r('app.media.main_page_token'))
          .size({ width: 25, height: 25 })
      }
      .padding({top: '7%'})
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .layoutWeight(1)
      .onClick(() => {
        this.index = 2;
        this.title = 'STEAM 令牌'
        this.shopping = false
      })

      Column() {
        Image(this.index == 3 ? $r('app.media.main_page_attention_selected') : $r('app.media.main_page_attention'))
          .size({ width: 25, height: 25 })
      }
      .padding({top: '7%'})
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .layoutWeight(1)
      .onClick(() => {
        this.index = 3;
        this.shopping = false
      })
      Column() {
        Image(this.index == 4 ? $r('app.media.main_page_more_selected') : $r('app.media.main_page_more'))
          .size({ width: 25, height: 25 })
      }
      .padding({top: '7%'})
      .alignItems(HorizontalAlign.Center)
      .height('100%')
      .layoutWeight(1)
      .onClick(() => {
        this.index = 4;
        this.shopping = false
      })

    }
    .width('100%')
    .backgroundColor('#202126')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }

  @Builder
  titleBuild() {
    if (this.index == 0){
      Column() {
        Image($r('app.media.main_page_shop_temp'))
          .width('90%')
      }
      .justifyContent(FlexAlign.End)
      .width('100%')
      .height('100%')
      .backgroundColor('#202126')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    else if (this.index == 2) {
      Column(){
        Row() {
          Image($r('app.media.back'))
            .width('7%')
          Text(this.title)
            .fontSize('22vp')
            .fontColor('#dee1e8')
            .offset({ x: '4%' })
          Image($r('app.media.user_icon'))
            .width('13%')
        }
        .offset({ y: '-15%' })
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
        .height('100%')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#202126')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    else {
      Column() {
        TextInput()
        Search({placeholder: 'STEAM®'})
          .width('80%')
          .height('100%')
          .backgroundColor($r('sys.color.white'))
      }
      .justifyContent(FlexAlign.End)
      .width('100%')
      .height('100%')
      .backgroundColor('#202126')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
  }

  build() {
    // 导航栏
    Navigation() {
      if (this.index == 0) {
        ShoppingPage({ shopping: this.shopping })
      } else if (this.index == 1) {
      } else if (this.index == 2) {
        TokenPage()
      } else if (this.index == 3) {
      } else if (this.index == 4) {
      }
    }
    .size({ width: '100%', height: '100%' })
    .title({ builder: this.titleBuild(), height: '6%' })
    .toolbarConfiguration(this.toolbar())
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .backgroundColor('#292c33')
  }
}