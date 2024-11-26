import { router } from '@kit.ArkUI'

@Component
export struct UserLoginUI {
  @Link isLogin: boolean
  build() {
    Column(){
      Text('登录')
        .fontSize('30vp')
        .fontColor('#dee1e8')
        .fontWeight(FontWeight.Lighter)
        .textAlign(TextAlign.Center)
        .margin({bottom: '10%', top: '5%'})
      Row(){
        Text('STEAM ')
          .fontSize('12vp')
          .fontColor('#dee1e8')
        Text('账户名称')
          .fontSize('12vp')
          .fontColor('#dee1e8')
          .fontWeight(FontWeight.Normal)
      }
      .width('80%')
      .margin({bottom: '3%'})
      TextInput({ text: '' })
        .backgroundColor('#202126')
        .borderRadius('1%')
        .width('80%')
        .height('7.5%')
        .fontColor('#e0e1e6')
        .fontSize('22vp')
        .padding({top: '0.5%', bottom: '0.5%'})
        .margin({bottom: '5%'})
      Text('密码')
        .fontSize('12vp')
        .fontColor('#dee1e8')
        .fontWeight(FontWeight.Normal)
      .width('80%')
      .margin({bottom: '3%'})
      TextInput({ text: '' })
        .backgroundColor('#202126')
        .borderRadius('1%')
        .width('80%')
        .height('7.5%')
        .fontColor('#e0e1e6')
        .fontSize('22vp')
        .padding({top: '0.5%', bottom: '0.5%'})
        .type(InputType.Password)
        .margin({bottom: '5%'})
        .showPasswordIcon(false)
      Button('登录')
        .width('80%')
        .height('6%')
        .fontSize('18vp')
        .fontColor('#dee1e8')
        .backgroundColor('#1997fd')
        .borderRadius('1%')
        .fontWeight(FontWeight.Normal)
        .type(ButtonType.Normal)
        .onClick(()=>{
          this.isLogin = false
          AppStorage.setOrCreate('login_status', true)
        })
      .margin({bottom: '10%'})
      Text('忘记了账户名称或密码?')
        .fontSize('16vp')
        .fontColor('#dee1e8')
        .onClick(()=>{
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#292c33')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}