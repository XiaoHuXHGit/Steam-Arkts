export interface GameData {
  name: string
  developers: string
  publishers: string
  release_date: string
  introduction: string
  tags: string[]
  types: string[]
  positive_appraise: number
  negative_appraise: number
  recent_positive_appraise: number
  recent_negative_appraise: number
  demo: boolean
  bundles: bundles[]
  function: string[]
  controller: string[]
  need_license_agreement: boolean
  hyperlink_and_message: website[]
}

interface bundles {
  bundle_name: string,
  images: string[]
  price: number,
  current: number
}

interface website {
  exist: boolean
  url: string
  name: string
}

export interface GameMedia {
  name: string
  type: string
}
