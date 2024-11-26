import { GameItem } from '../viewmodel/ShoppingPageResourceAcquisition'
import { GamePage } from './GamePage';
import { ShoppingContent } from './ShoppingContent'

@Component
export struct ShoppingPage {
  @Link shopping: boolean
  @State shopping_argparse: GameItem = {
    name: '暂无',
    price: 0,
    current: 0,
    cover: '',
    isLive: false,
    code: ''
  }

  build() {
    Column() {
      Row({ space: '28vp' }) {
        Row() {
          Text('菜单')
            .fontSize('12vp')
            .fontColor('#dee1e8')
          Image($r('app.media.main_page_dropdown'))
            .width('3.5%')
        }

        Text('愿望单')
          .fontSize('12vp')
          .fontColor('#dee1e8')
        Text('钱包')
          .fontSize('12vp')
          .fontColor('#dee1e8')
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#202126')
      .width('100%')
      .height('6%')

      // 商城主页
      if (this.shopping) {
        GamePage({ shopping_argparse: this.shopping_argparse })
          .height('94%')
      } else {
        ShoppingContent({ shopping: this.shopping, shopping_argparse: this.shopping_argparse})
          .height('94%')
      }
    }
  }
}