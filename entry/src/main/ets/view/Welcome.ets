import App from '@system.app'

@Entry
@Component
struct Welcome {
  build() {
    Column(){
      Text('欢迎回到')
        .fontColor('#209df7')
        .fontWeight(FontWeight.Normal)
        .fontSize('38vp')
        .margin({left: '0.6%', right: '0.6%'})
        .offset({y: '-1.5%'})
      Image($r("app.media.steam_fill_round"))
        .width('40%')
        .margin({top: '3%', bottom: '7%'})
      Row(){
        ForEach(['S', 'T', 'E', 'A', 'M'], (item: string)=>{
          Text(item)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize('64vp')
            .margin({left: '0.6%', right: '0.6%'})
        })
        Text('®')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Lighter)
          .fontSize('36vp')
          .margin({left: '0.6%', right: '0.6%'})
          .offset({y: '-1.5%'})
      }
    }
    .animation({duration: 500})
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundImage($r("app.media.welcome_background"))
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}