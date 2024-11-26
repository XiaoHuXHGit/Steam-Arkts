import { GameData, GameMedia } from '../model/GameData'
import { GameItem, SpecialOfferGameItem } from '../model/GameItem'

export const feature_and_recommend: GameItem[] = [
  {
    name: 'Grand Theft Auto V',
    price: 168.72,
    current: 67.72,
    cover: '',
    isLive: false,
    code: 'gta5'
  },
  {
    name: '鸣潮',
    price: 0.00,
    current: 0.00,
    cover: '',
    isLive: false,
    code: 'ww'
  },
  {
    name: 'The Witcher 3: Wild Hunt',
    price: 59.99,
    current: 59.99,
    cover: '',
    isLive: false,
    code: 'witcher3'
  },
  {
    name: 'Red Dead Redemption 2',
    price: 257.99,
    current: 257.99,
    cover: '',
    isLive: false,
    code: 'redemption2'
  },
  {
    name: 'The Legend of Zelda: Breath of the Wild',
    price: 59.99,
    current: 49.99,
    cover: '',
    isLive: false,
    code: 'zelda'
  }
]

export const game_data_storage: GameData = {
  name: "Detroit: Become Human",
  developers: "小子，没连上服务器",
  publishers: "Quantic Dream",
  release_date: "2020 年 6 月 18 日",
  introduction: "在《底特律:化身为人》中，人类和机器人的命运都将学握在您的手中，您将走进一个不远的未来，一个机器人具有比人类更高智慧的时代。您将体验到史上最为复杂的分支故事-一您所作出的每个选择都将影游戏的结局。",
  tags: [
    "选择取向",
    "剧情丰富",
    "多结局",
    "单人"
  ],
  types: [
    "动作",
    "冒险"
  ],
  positive_appraise: 110600,
  negative_appraise: 5821,
  recent_positive_appraise: 3729,
  recent_negative_appraise: 115,
  demo: true,
  bundles: [
    {
      bundle_name: "Quantic Dream Collection",
      images: [],
      price: 306.00,
      current: 72.72
    }
  ],
  function: [
    "单人",
    "Steam 成就",
    "Steam 云",
    "在电视上远程畅玩",
    "家庭共享"
  ],
  controller: [
    "Xbox 控制器",
    "尚不清楚是否支持其他控制器"
  ],
  need_license_agreement: true,
  hyperlink_and_message: [
    {
      exist: true,
      url: "",
      name: "website"
    },
    {
      exist: true,
      url: "",
      name: "twitch"
    },
    {
      exist: true,
      url: "",
      name: "x"
    },
    {
      exist: true,
      url: "",
      name: "youtube"
    }
  ]
}

export const game_media_storage: GameMedia[] = [
  {
    name: 'default',
    type: 'image'
  }
]

export const special_offers: SpecialOfferGameItem[] = [
  {
    name: 'Grand Theft Auto V',
    price: 168.72,
    current: 67.72,
    cover: '',
    isLive: false,
    code: 'gta5',
    isCollection: true,
    deadline: '11月26日 上午 2:00',
    hidePrice: false
  },
  {
    name: 'Minecraft',
    price: 256.00,
    current: 46.00,
    cover: '',
    isLive: false,
    code: 'minecraft',
    isCollection: true,
    deadline: '11月26日 上午 2:00',
    hidePrice: true
  },
  {
    name: 'Fortnite',
    price: 199.00,
    current: 99.00,
    cover: '',
    isLive: true,
    code: 'fortnite',
    isCollection: false,
    deadline: '12月10日 下午 5:00',
    hidePrice: false
  },
  {
    name: 'Among Us',
    price: 30.00,
    current: 15.00,
    cover: '',
    isLive: false,
    code: 'amongus',
    isCollection: false,
    deadline: '10月30日 晚上 8:00',
    hidePrice: true
  },
  {
    name: 'Valheim',
    price: 80.00,
    current: 60.00,
    cover: '',
    isLive: true,
    code: 'valheim',
    isCollection: false,
    deadline: '11月15日 上午 10:00',
    hidePrice: false
  },
  {
    name: 'Cyberpunk 2077',
    price: 299.00,
    current: 250.00,
    cover: '',
    isLive: false,
    code: 'cyberpunk2077',
    isCollection: true,
    deadline: '12月20日 下午 3:00',
    hidePrice: true
  },
  {
    name: 'Stardew Valley',
    price: 60.00,
    current: 45.00,
    cover: '',
    isLive: true,
    code: 'stardewvalley',
    isCollection: false,
    deadline: '11月30日 晚上 9:00',
    hidePrice: false
  },
  {
    name: 'Terraria',
    price: 50.00,
    current: 35.00,
    cover: '',
    isLive: false,
    code: 'terraria',
    isCollection: false,
    deadline: '12月5日 上午 7:00',
    hidePrice: true
  }
]