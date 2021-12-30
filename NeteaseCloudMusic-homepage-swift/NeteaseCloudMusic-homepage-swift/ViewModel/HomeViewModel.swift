//
//  HomeViewModel.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/16.
//

import Foundation
import UIKit
/// 类型
enum HomeViewModelSectionType {
    case BANNER             // Banner
    case MENUS              // 圆形按钮
    case PLAYLIST_RCMD      // 推荐歌单
    case STYLE_RCMD         // 个性推荐
    case MUSIC_MLOG         // 精选音乐视频
    case MGC_PLAYLIST       // 雷达歌单
    case MUSIC_CALENDAR     // 音乐日历
    case OFFICIAL_PLAYLIST  // 专属场景歌单
    case ALBUM_NEW_SONG     // 云贝新歌
    case VOICELIST_RCMD     // 播客合辑
    case PODCAST24          // 24小时播客
    case VIDEO_PLAYLIST     // 视频合辑
}

protocol HomeViewModelSection {
    var type: HomeViewModelSectionType { get }
    var rowCount: Int { get }
    var rowHeight: CGFloat {get}
    var frame: CGRect {get set}
}

extension HomeViewModelSection {
    var rowCount: Int {
        return 1
    }
}

protocol HomeViewModelDelegate: NSObject {
    func onFetchComplete()
    func onFetchFailed(with reason: String)
}

class HomeViewModel : NSObject {
    var sectioins = [HomeViewModelSection]()
    weak var delegate: HomeViewModelDelegate?
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData() {
        //首页两接口
        let queueGroup = DispatchGroup()
        queueGroup.enter()
        
        NetworkManager<HomePage>.requestData(.get, URLString: NeteaseURL.Home.urlString, parameters: nil) { result in
            switch result {
            case .success(let response):
                self.sectioins = self.splitData(data: response.data.blocks)
                queueGroup.leave()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.onFetchFailed(with: error.localizedDescription)
                queueGroup.leave()
            }
            
        }
    }
    
    func splitData(data: [Block]) -> [HomeViewModelSection] {
        var array:[HomeViewModelSection] = [HomeViewModelSection]()
        
        for item in data {
            if item.blockCode == "HOMEPAGE_BANNER" || item.blockCode == "HOMEPAGE_MUSIC_MLOG"{
                switch item.extInfo {
                case .extInfoElementArray(let result):
                    // 精选音乐视频
                    let model: MusicMLOGModel = MusicMLOGModel(mLog: result, ui: item.uiElement!)
                    array.append(model)
                    break
                case .purpleEXTInfo(let result):
                    // BANNER
                    let banner: [Banner] = result.banners
                    let model: BannerModel = BannerModel(banners: banner)
                    array.append(model)
                    break
                case .none:
                    break
                }
            } else if item.blockCode == "HOMEPAGE_BLOCK_PLAYLIST_RCMD" {
                // 推荐歌单
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model: PlaylistRcmdModel = PlaylistRcmdModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_BLOCK_STYLE_RCMD" {
                // 个性推荐
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model:StyleRcmdModel = StyleRcmdModel(creatives: creatives, ui: ui)
                array.append(model)
            }  else if item.blockCode == "HOMEPAGE_BLOCK_MGC_PLAYLIST" {
                // 网易云音乐的雷达歌单
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model:MgcPlaylistModel = MgcPlaylistModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_MUSIC_CALENDAR" {
                // 音乐日历
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model:MusicCalendarModel = MusicCalendarModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_BLOCK_OFFICIAL_PLAYLIST" {
                // 专属场景歌单
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model:OfficialPlaylistModel = OfficialPlaylistModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_BLOCK_NEW_ALBUM_NEW_SONG" {
                // 新歌
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model: AlbumNewSongModel = AlbumNewSongModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_VOICELIST_RCMD" {
                // 播客合辑
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model: VoiceListRcmdModel = VoiceListRcmdModel(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_PODCAST24" {
                // 24小时播客
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model: Podcast24Model = Podcast24Model(creatives: creatives, ui: ui)
                array.append(model)
            } else if item.blockCode == "HOMEPAGE_BLOCK_VIDEO_PLAYLIST" {
                // 视频合辑
                let ui: BlockUIElement = item.uiElement!
                let creatives: [Creative] = item.creatives!
                let model: VideoPlaylistModel = VideoPlaylistModel(creatives: creatives, ui: ui)
                array.append(model)
            }
        }
        
        return array
    }
}
