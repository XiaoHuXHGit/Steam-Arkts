import { UserLoginUI } from '../view/UserLoginUI';
import { MainPage } from '../view/MainPage';
import { online_service_params_initialize } from '../viewmodel/OnlineService';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State isLogin: boolean = false

  aboutToAppear(): void {
    AppStorage.setOrCreate('login_status', true)
    AppStorage.setOrCreate('online_service', true)
    this.isLogin = !AppStorage.get('login_status')
    if (AppStorage.get('online_service')) { online_service_params_initialize() }
  }
  build() {
    RelativeContainer() {
      // 登没登陆
      if (this.isLogin) {
        UserLoginUI({isLogin: this.isLogin})
      }
      else {
        MainPage()
      }
    }
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .height('100%')
    .width('100%')
  }
}