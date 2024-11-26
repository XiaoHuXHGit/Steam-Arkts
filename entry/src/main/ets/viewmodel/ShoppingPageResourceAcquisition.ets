import { feature_and_recommend, game_data_storage, game_media_storage } from '../data_storage/GameItemListStorage'
import { GameItem } from '../model/GameItem'
import { GameData, GameMedia } from '../model/GameData';
import http from '@ohos.net.http';


export async function get_recommend_game_items(): Promise<GameItem[]> {
  let feature_and_recommend_list: GameItem[] = []
  if (AppStorage.get('online_service')) {
    let url = AppStorage.get('server') + '/ShoppingItemsGet'
    const httpRequest = http.createHttp()
    const responseResult = httpRequest.request(url, { method: http.RequestMethod.GET })
    await responseResult
      .then((response: http.HttpResponse) => {
        if (response.responseCode === 200) {
          let ServerResponse: string = response.result.toString()
          let feature_and_recommend_json_decode: GameItem[] = JSON.parse(ServerResponse)
          for (const jsonItem of feature_and_recommend_json_decode) {
            feature_and_recommend_list.push(jsonItem)
          }
        } else {
          console.error('守岸人正在疯狂修理服务器，状态码:', response.responseCode)
          feature_and_recommend_list = feature_and_recommend
        }
      })
      .catch((error: string) => {
        console.error('守岸人正在维护服务器:', error)
        feature_and_recommend_list = feature_and_recommend
      })
  } else {
    feature_and_recommend_list = feature_and_recommend
  }
  return feature_and_recommend_list
}

export async function get_game_data(code: string): Promise<GameData> {
  let game_data: GameData = game_data_storage
  if (AppStorage.get('online_service')) {
    let url = AppStorage.get('server') + `/ShoppingGameDataGet?code=${code}`
    const httpRequest = http.createHttp()
    const responseResult = httpRequest.request(url, { method: http.RequestMethod.GET })
    await responseResult
      .then((response: http.HttpResponse) => {
        if (response.responseCode === 200) {
          let ServerResponse: string = response.result.toString()
          game_data = JSON.parse(ServerResponse)
        } else {
          console.error('守岸人正在疯狂修理服务器，状态码:', response.responseCode)
        }
      })
      .catch((error: string) => {
        console.error('守岸人正在维护服务器:', error)
      })
  }
  return game_data
}

export async function get_game_media_data(code: string): Promise<GameMedia[]> {
  let game_media_data_list: GameMedia[] = game_media_storage
  if (AppStorage.get('online_service')) {
    let url = AppStorage.get('server') + `/GameMediaListGet?code=${code}`
    const httpRequest = http.createHttp()
    const responseResult = httpRequest.request(url, { method: http.RequestMethod.GET })
    await responseResult
      .then((response: http.HttpResponse) => {
        if (response.responseCode === 200) {
          let ServerResponse: string = response.result.toString()
          game_media_data_list = JSON.parse(ServerResponse)
        } else {
          console.error('守岸人正在疯狂修理服务器，状态码:', response.responseCode)
        }
      })
      .catch((error: string) => {
        console.error('守岸人正在维护服务器:', error)
      })
  }
  return game_media_data_list
}

export function get_media_image(code: string, game_media: GameMedia): string {
  return `${AppStorage.get('server')}/GameMediaGet?code=${code}&media_type=${game_media.type}&name=${game_media.name}`
}

export function get_video_cover(code: string, game_media: GameMedia): string {
  return `${AppStorage.get('server')}/GameVideoCoverGet?code=${code}&name=${game_media.name}`
}


export { GameItem, GameData, GameMedia }