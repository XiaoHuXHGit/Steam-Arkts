import { GameItem } from './ShoppingPageResourceAcquisition'

export class Evaluation {
  public total_appraise: number = 0
  public positive_appraise_rate: number = 0
  public rating_string: string = ''
  public rating_color = ''

  constructor(positive_appraise: number, negative_appraise: number) {
    this.total_appraise = positive_appraise + negative_appraise
    this.positive_appraise_rate = Math.floor(positive_appraise / this.total_appraise * 100)
    this.evaluation_rating()
  }

  public evaluation_string(): string {
    return ` (${this.total_appraise.toLocaleString()} 篇中的 ${this.positive_appraise_rate}%) `
  }

  /*
  1、好评如潮，好评率大于等于百分之95，且评论数量过500。
  2、特别好评，好评率大于等于百分之80。
  3、多半好评，好评率大于等于百分之70。
  4、褒贬不一，好评率小于等于百分之70，且高于百分之40。
  5、多半差评，好评率小于等于百分之40，且高于百分之30。
  6、特别差评，好评率小于等于百分之30。
  7、差评如潮，好评率小于等于百分之20，且评论数量过500，如果不超过500，则显示特别差评。
  */
  private evaluation_rating(): void {
    if (this.positive_appraise_rate >= 95 && this.total_appraise >= 500) {
      this.rating_string = '好评如潮'
      this.rating_color = '#6fbee9'
    } else if (this.positive_appraise_rate >= 80 && this.positive_appraise_rate < 95) {
      this.rating_string = '特别好评'
      this.rating_color = '#6fbee9 '
    } else if (this.positive_appraise_rate >= 70 && this.positive_appraise_rate < 80) {
      this.rating_string = '多半好评'
      this.rating_color = '#6fc1f0'
    } else if (this.positive_appraise_rate <= 70 && this.positive_appraise_rate >= 40) {
      this.rating_string = '褒贬不一'
      this.rating_color = '#a69369'
    } else if (this.positive_appraise_rate <= 40 && this.positive_appraise_rate >= 30) {
      this.rating_string = '多半差评'
      this.rating_color = '#a34b25'
    } else if (this.positive_appraise_rate <= 30) {
      this.rating_string = '特别差评'
      this.rating_color = '#a34b25'
    } else if (this.positive_appraise_rate <= 20 && this.total_appraise >= 500) {
      this.rating_string = '差评如潮'
      this.rating_color = '#a34b25'
    } else {
      this.rating_string = '特别差评'
      this.rating_color = '#a34b25'
    }
  }
}

export function discount_price(gameItem: GameItem): string {
  return '-' + (Math.floor((1 - gameItem.current / gameItem.price) * 100)).toString() + '%'
}
