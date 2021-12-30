//
//  HomePageModel.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/16.
//

import Foundation


// MARK: - Welcome
struct HomePage: Codable {
    let code: Int
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let cursor: JSONNull?
    let blocks: [Block]
    let hasMore: Bool
    let blockUUIDs: JSONNull?
    let pageConfig: PageConfig
    let guideToast: GuideToast
}

// MARK: - Block
struct Block: Codable {
    let blockCode, showType: String
    let extInfo: EXTInfoUnion?
    let canClose: Bool
    let action: String?
    let actionType: ActionType?
    let uiElement: BlockUIElement?
    let creatives: [Creative]?
}

enum ActionType: String, Codable {
    case clientCustomized = "client_customized"
    case orpheus = "orpheus"
}

// MARK: - Creative
struct Creative: Codable {
    let creativeType: String
    let creativeID, action: String?
    let actionType: ActionType?
    let uiElement: CreativeUIElement?
    let resources: [ResourceElement]?
    let alg, logInfo: String?
    let position: Int
    let code: String?
    let creativeEXTInfoVO: CreativeEXTInfoVO?
    let source, algReason: String?

    enum CodingKeys: String, CodingKey {
        case creativeType
        case creativeID = "creativeId"
        case action, actionType, uiElement, resources, alg, logInfo, position, code
        case creativeEXTInfoVO = "creativeExtInfoVO"
        case source, algReason
    }
}

// MARK: - CreativeEXTInfoVO
struct CreativeEXTInfoVO: Codable {
    let playCount: Int
    let djProgram: DjProgram?
}

// MARK: - DjProgram
struct DjProgram: Codable {
    let mainSong: MainSong
    let songs: JSONNull?
    let dj: Dj
    let blurCoverURL: String
    let radio: Radio
    let subscribedCount: Int
    let reward: Bool
    let mainTrackID, serialNum, listenerCount: Int
    let name: String
    let id, createTime: Int
    let djProgramDescription: String
    let userID: Int
    let coverURL: String
    let commentThreadID: String
    let channels: [String]
    let titbits, titbitImages: JSONNull?
    let pubStatus, trackCount, bdAuditStatus, programFeeType: Int
    let buyed: Bool
    let programDesc: JSONNull?
    let h5Links: [JSONAny]
    let coverID: Double
    let adjustedPlayCount: Int
    let canReward: Bool
    let auditStatus, updateTime, categoryID: Int
    let category: JSONNull?
    let secondCategoryID: Int
    let secondCategory: JSONNull?
    let scheduledPublishTime: Int
    let privacy, publish: Bool
    let duration: Int
    let extProperties, xInfo: DjProgramEXTProperties

    enum CodingKeys: String, CodingKey {
        case mainSong, songs, dj
        case blurCoverURL = "blurCoverUrl"
        case radio, subscribedCount, reward
        case mainTrackID = "mainTrackId"
        case serialNum, listenerCount, name, id, createTime
        case djProgramDescription = "description"
        case userID = "userId"
        case coverURL = "coverUrl"
        case commentThreadID = "commentThreadId"
        case channels, titbits, titbitImages, pubStatus, trackCount, bdAuditStatus, programFeeType, buyed, programDesc, h5Links
        case coverID = "coverId"
        case adjustedPlayCount, canReward, auditStatus, updateTime
        case categoryID = "categoryId"
        case category
        case secondCategoryID = "secondCategoryId"
        case secondCategory, scheduledPublishTime, privacy, publish, duration, extProperties, xInfo
    }
}

// MARK: - Dj
struct Dj: Codable {
    let extProperties: DjEXTProperties
    let defaultAvatar: Bool
    let province, authStatus: Int
    let followed: Bool
    let avatarURL: String
    let accountStatus, gender, city, birthday: Int
    let userID, userType: Int
    let nickname, signature, djDescription, detailDescription: String
    let avatarImgID: Double
    let backgroundImgID: Int
    let backgroundURL: String
    let authority: Int
    let mutual: Bool
    let expertTags, experts: JSONNull?
    let djStatus, vipType: Int
    let remarkName: JSONNull?
    let backgroundImgIDStr, avatarImgIDStr: String
    let xInfo: DjEXTProperties

    enum CodingKeys: String, CodingKey {
        case extProperties, defaultAvatar, province, authStatus, followed
        case avatarURL = "avatarUrl"
        case accountStatus, gender, city, birthday
        case userID = "userId"
        case userType, nickname, signature
        case djDescription = "description"
        case detailDescription
        case avatarImgID = "avatarImgId"
        case backgroundImgID = "backgroundImgId"
        case backgroundURL = "backgroundUrl"
        case authority, mutual, expertTags, experts, djStatus, vipType, remarkName
        case backgroundImgIDStr = "backgroundImgIdStr"
        case avatarImgIDStr = "avatarImgIdStr"
        case xInfo
    }
}

// MARK: - DjEXTProperties
struct DjEXTProperties: Codable {
    let avatarImgIDStr, brand: String

    enum CodingKeys: String, CodingKey {
        case avatarImgIDStr = "avatarImgId_str"
        case brand
    }
}

// MARK: - DjProgramEXTProperties
struct DjProgramEXTProperties: Codable {
    let shareCount: Int
    let subscribed: Bool
    let likedCount, commentCount: Int
}

// MARK: - MainSong
struct MainSong: Codable {
    let name: String
    let id, position: Int
    let alias: [JSONAny]
    let status, fee, copyrightID: Int
    let disc: String
    let no: Int
    let artists: [AlbumArtist]
    let album: MainSongAlbum
    let starred: Bool
    let popularity, score, starredNum, duration: Int
    let playedNum, dayPlays, hearTime: Int
    let ringtone: String
    let crbt, audition: JSONNull?
    let copyFrom, commentThreadID: String
    let rtURL: JSONNull?
    let ftype: Int
    let rtUrls: [JSONAny]
    let copyright: Int
    let transName, sign: JSONNull?
    let mark, originCoverType: Int
    let originSongSimpleData: JSONNull?
    let single: Int
    let noCopyrightRcmd: JSONNull?
    let rtype: Int
    let rurl: JSONNull?
    let mvid: Int
    let hMusic, mMusic: JSONNull?
    let lMusic, bMusic: Music
    let mp3URL, extProperties, xInfo: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, id, position, alias, status, fee
        case copyrightID = "copyrightId"
        case disc, no, artists, album, starred, popularity, score, starredNum, duration, playedNum, dayPlays, hearTime, ringtone, crbt, audition, copyFrom
        case commentThreadID = "commentThreadId"
        case rtURL = "rtUrl"
        case ftype, rtUrls, copyright, transName, sign, mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, rtype, rurl, mvid, hMusic, mMusic, lMusic, bMusic
        case mp3URL = "mp3Url"
        case extProperties, xInfo
    }
}

// MARK: - MainSongAlbum
struct MainSongAlbum: Codable {
    let name: String
    let id: Int
    let type: JSONNull?
    let size, picID: Int
    let blurPicURL: JSONNull?
    let companyID, pic: Int
    let picURL: String
    let publishTime: Int
    let albumDescription, tags: String
    let company: JSONNull?
    let briefDesc: String
    let artist: AlbumArtist
    let songs, alias: [JSONAny]
    let status, copyrightID: Int
    let commentThreadID: String
    let artists: [AlbumArtist]
    let subType, transName: JSONNull?
    let onSale: Bool
    let mark: Int
    let extProperties, xInfo: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, id, type, size
        case picID = "picId"
        case blurPicURL = "blurPicUrl"
        case companyID = "companyId"
        case pic
        case picURL = "picUrl"
        case publishTime
        case albumDescription = "description"
        case tags, company, briefDesc, artist, songs, alias, status
        case copyrightID = "copyrightId"
        case commentThreadID = "commentThreadId"
        case artists, subType, transName, onSale, mark, extProperties, xInfo
    }
}

// MARK: - AlbumArtist
struct AlbumArtist: Codable {
    let name: String
    let id, picID, img1V1ID: Int
    let briefDesc: String
    let picURL, img1V1URL: String?
    let albumSize: Int
    let alias: [JSONAny]?
    let trans: String?
    let musicSize, topicPerson: Int
    let extProperties, xInfo: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, id
        case picID = "picId"
        case img1V1ID = "img1v1Id"
        case briefDesc
        case picURL = "picUrl"
        case img1V1URL = "img1v1Url"
        case albumSize, alias, trans, musicSize, topicPerson, extProperties, xInfo
    }
}

// MARK: - Music
struct Music: Codable {
    let name: JSONNull?
    let id, size: Int
    let musicExtension: Extension
    let sr, dfsID, bitrate, playTime: Int
    let volumeDelta: Int
    let extProperties, xInfo: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, id, size
        case musicExtension = "extension"
        case sr
        case dfsID = "dfsId"
        case bitrate, playTime, volumeDelta, extProperties, xInfo
    }
}

enum Extension: String, Codable {
    case mp3 = "mp3"
}

// MARK: - Radio
struct Radio: Codable {
    let id: Int
    let dj: JSONNull?
    let name: String
    let picURL: String
    let desc: String
    let subCount, programCount, createTime, categoryID: Int
    let category: String
    let secondCategoryID: Int
    let secondCategory: JSONNull?
    let radioFeeType, feeScope: Int
    let buyed: Bool
    let videos: JSONNull?
    let finished, underShelf: Bool
    let purchaseCount, price, originalPrice: Int
    let discountPrice: JSONNull?
    let lastProgramCreateTime: Int
    let lastProgramName: JSONNull?
    let lastProgramID: Int
    let picID: Double
    let rcmdText: String
    let hightQuality, whiteList: Bool
    let liveInfo: JSONNull?
    let playCount: Int
    let icon: JSONNull?
    let privacy: Bool
    let intervenePicURL: JSONNull?
    let intervenePicID: Int
    let radioDynamic: Bool
    let shortName: JSONNull?
    let taskID: Int
    let composeVideo: Bool
    let extProperties, xInfo: RadioEXTProperties

    enum CodingKeys: String, CodingKey {
        case id, dj, name
        case picURL = "picUrl"
        case desc, subCount, programCount, createTime
        case categoryID = "categoryId"
        case category
        case secondCategoryID = "secondCategoryId"
        case secondCategory, radioFeeType, feeScope, buyed, videos, finished, underShelf, purchaseCount, price, originalPrice, discountPrice, lastProgramCreateTime, lastProgramName
        case lastProgramID = "lastProgramId"
        case picID = "picId"
        case rcmdText, hightQuality, whiteList, liveInfo, playCount, icon, privacy
        case intervenePicURL = "intervenePicUrl"
        case intervenePicID = "intervenePicId"
        case radioDynamic = "dynamic"
        case shortName
        case taskID = "taskId"
        case composeVideo, extProperties, xInfo
    }
}

// MARK: - RadioEXTProperties
struct RadioEXTProperties: Codable {
    let subed: Bool
}

// MARK: - ResourceElement
struct ResourceElement: Codable {
    let uiElement: ResourceUIElement
    let resourceType: ResourceType
    let resourceID: String
    let resourceURL: String?
    let resourceEXTInfo: ResourceEXTInfo?
    let action: String
    let actionType: ActionType
    let valid: Bool
    let alg, logInfo: String?

    enum CodingKeys: String, CodingKey {
        case uiElement, resourceType
        case resourceID = "resourceId"
        case resourceURL = "resourceUrl"
        case resourceEXTInfo = "resourceExtInfo"
        case action, actionType, valid, alg, logInfo
    }
}

// MARK: - ResourceEXTInfo
struct ResourceEXTInfo: Codable {
    let playCount: Int?
    let highQuality: Bool?
    let specialType: Int?
    let artists: [AlbumArtist]?
    let song: ResourceEXTInfoSong?
    let songData: SongData?
    let songPrivilege: SongPrivilege?
    let commentSimpleData: CommentSimpleData?
    let alias: String?
    let startTime, endTime: Int?
    let subed, canSubscribe: Bool?
    let tags: [String]?
    let bigEvent: Bool?
    let eventID, eventType: String?
    let subCount, specialCover: Int?

    enum CodingKeys: String, CodingKey {
        case playCount, highQuality, specialType, artists, song, songData, songPrivilege, commentSimpleData, alias, startTime, endTime, subed, canSubscribe, tags, bigEvent
        case eventID = "eventId"
        case eventType, subCount, specialCover
    }
}

// MARK: - CommentSimpleData
struct CommentSimpleData: Codable {
    let content: String
    let commentID: Int
    let threadID: String?
    let userID: Int
    let userName: String?

    enum CodingKeys: String, CodingKey {
        case content
        case commentID = "commentId"
        case threadID = "threadId"
        case userID = "userId"
        case userName
    }
}

// MARK: - ResourceEXTInfoSong
struct ResourceEXTInfoSong: Codable {
    let name: String
    let id, pst, t: Int
    let ar: [Ar]
    let alia: [String]
    let pop, st: Int
    let rt: Rt?
    let fee, v: Int
    let crbt: JSONNull?
    let cf: String
    let al: Al
    let dt: Int
    let h: H?
    let m, l: H
    let a: JSONNull?
    let cd: String
    let no: Int
    let rtURL: JSONNull?
    let ftype: Int
    let rtUrls: [JSONAny]
    let djID, copyright, sID, mark: Int
    let originCoverType: Int
    let originSongSimpleData: JSONNull?
    let single: Int
    let noCopyrightRcmd: JSONNull?
    let rtype: Int
    let rurl: JSONNull?
    let mst, cp, mv, publishTime: Int
    let videoInfo: VideoInfo

    enum CodingKeys: String, CodingKey {
        case name, id, pst, t, ar, alia, pop, st, rt, fee, v, crbt, cf, al, dt, h, m, l, a, cd, no
        case rtURL = "rtUrl"
        case ftype, rtUrls
        case djID = "djId"
        case copyright
        case sID = "s_id"
        case mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, rtype, rurl, mst, cp, mv, publishTime, videoInfo
    }
}

// MARK: - Al
struct Al: Codable {
    let id: Int
    let name: String
    let picURL: String
    let tns: [JSONAny]
    let pic: Double
    let picStr: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case picURL = "picUrl"
        case tns, pic
        case picStr = "pic_str"
    }
}

// MARK: - Ar
struct Ar: Codable {
    let id: Int
    let name: String
    let tns, alias: [JSONAny]
}

// MARK: - H
struct H: Codable {
    let br, fid, size, vd: Int
}

enum Rt: String, Codable {
    case empty = ""
    case the600902000009329278 = "600902000009329278"
}

// MARK: - VideoInfo
struct VideoInfo: Codable {
    let moreThanOne: Bool
    let video: Video?
}

// MARK: - Video
struct Video: Codable {
    let vid: String
    let type: Int
    let title: String?
    let playTime: Int
    let coverURL: String?
    let publishTime: Int
    let artists, alias: JSONNull?

    enum CodingKeys: String, CodingKey {
        case vid, type, title, playTime
        case coverURL = "coverUrl"
        case publishTime, artists, alias
    }
}

// MARK: - SongData
struct SongData: Codable {
    let name: String
    let id, position: Int
    let alias: [String]
    let status, fee, copyrightID: Int
    let disc: String
    let no: Int
    let artists: [AlbumArtist]
    let album: SongDataAlbum
    let starred: Bool
    let popularity, score, starredNum, duration: Int
    let playedNum, dayPlays, hearTime: Int
    let ringtone: Rt?
    let crbt, audition: JSONNull?
    let copyFrom, commentThreadID: String
    let rtURL: JSONNull?
    let ftype: Int
    let rtUrls: [JSONAny]
    let copyright: Int
    let transName, sign: JSONNull?
    let mark, originCoverType: Int
    let originSongSimpleData: OriginSongSimpleData?
    let single: Int
    let noCopyrightRcmd: JSONNull?
    let rtype: Int
    let rurl: JSONNull?
    let mvid: Int
    let hMusic: Music?
    let mMusic, lMusic, bMusic: Music
    let mp3URL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case name, id, position, alias, status, fee
        case copyrightID = "copyrightId"
        case disc, no, artists, album, starred, popularity, score, starredNum, duration, playedNum, dayPlays, hearTime, ringtone, crbt, audition, copyFrom
        case commentThreadID = "commentThreadId"
        case rtURL = "rtUrl"
        case ftype, rtUrls, copyright, transName, sign, mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, rtype, rurl, mvid, hMusic, mMusic, lMusic, bMusic
        case mp3URL = "mp3Url"
    }
}

// MARK: - SongDataAlbum
struct SongDataAlbum: Codable {
    let name: String
    let id: Int
    let type: TypeEnum
    let size: Int
    let picID: Double
    let blurPicURL: String
    let companyID: Int
    let pic: Double
    let picURL: String
    let publishTime: Int
    let albumDescription, tags: String
    let company: String?
    let briefDesc: String
    let artist: AlbumArtist
    let songs: [JSONAny]
    let alias: [String]
    let status, copyrightID: Int
    let commentThreadID: String
    let artists: [AlbumArtist]
    let subType: SubType
    let transName: JSONNull?
    let onSale: Bool
    let mark: Int
    let picIDStr: String?

    enum CodingKeys: String, CodingKey {
        case name, id, type, size
        case picID = "picId"
        case blurPicURL = "blurPicUrl"
        case companyID = "companyId"
        case pic
        case picURL = "picUrl"
        case publishTime
        case albumDescription = "description"
        case tags, company, briefDesc, artist, songs, alias, status
        case copyrightID = "copyrightId"
        case commentThreadID = "commentThreadId"
        case artists, subType, transName, onSale, mark
        case picIDStr = "picId_str"
    }
}

enum SubType: String, Codable {
    case empty = ""
    case 录音室版 = "录音室版"
}

enum TypeEnum: String, Codable {
    case ep = "EP"
    case epSingle = "EP/Single"
    case single = "Single"
    case 专辑 = "专辑"
}

// MARK: - OriginSongSimpleData
struct OriginSongSimpleData: Codable {
    let songID: Int
    let name: String
    let artists: [AlbumMeta]
    let albumMeta: AlbumMeta

    enum CodingKeys: String, CodingKey {
        case songID = "songId"
        case name, artists, albumMeta
    }
}

// MARK: - AlbumMeta
struct AlbumMeta: Codable {
    let id: Int
    let name: String
}

// MARK: - SongPrivilege
struct SongPrivilege: Codable {
    let id, fee, payed, realPayed: Int
    let st, pl, dl, sp: Int
    let cp, subp: Int
    let cs: Bool
    let maxbr, fl: Int
    let pc: JSONNull?
    let toast: Bool
    let flag: Int
    let paidBigBang, preSell: Bool
    let playMaxbr, downloadMaxbr: Int
    let rscl: JSONNull?
    let freeTrialPrivilege: FreeTrialPrivilege
    let chargeInfoList: [ChargeInfoList]
}

// MARK: - ChargeInfoList
struct ChargeInfoList: Codable {
    let rate: Int
    let chargeURL, chargeMessage: JSONNull?
    let chargeType: Int

    enum CodingKeys: String, CodingKey {
        case rate
        case chargeURL = "chargeUrl"
        case chargeMessage, chargeType
    }
}

// MARK: - FreeTrialPrivilege
struct FreeTrialPrivilege: Codable {
    let resConsumable, userConsumable: Bool
}

enum ResourceType: String, Codable {
    case album = "album"
    case digitalAlbum = "digitalAlbum"
    case fmRadio = "fm_radio"
    case list = "list"
    case orpheus = "ORPHEUS"
    case resourceTypeALBUM = "ALBUM"
    case song = "song"
    case webview = "WEBVIEW"
}

// MARK: - ResourceUIElement
struct ResourceUIElement: Codable {
    let mainTitle: Title
    let subTitle: PurpleSubTitle?
    let image: Image
    let labelTexts: [String]?
    let rcmdShowType: RcmdShowType
}

// MARK: - Image
struct Image: Codable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
    }
}

// MARK: - Title
struct Title: Codable {
    let title: String
}

enum RcmdShowType: String, Codable {
    case rcmdShowTypeDEFAULT = "DEFAULT"
}

// MARK: - PurpleSubTitle
struct PurpleSubTitle: Codable {
    let title: String
    let titleType: String?
}

// MARK: - CreativeUIElement
struct CreativeUIElement: Codable {
    let mainTitle, subTitle: Title?
    let image: Image?
    let labelTexts: [String]?
    let rcmdShowType: RcmdShowType
    let button: Button?
    let labelType: String?
}

// MARK: - Button
struct Button: Codable {
    let action: String
    let actionType: ActionType
    let text: String
    let iconURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case action, actionType, text
        case iconURL = "iconUrl"
    }
}

enum EXTInfoUnion: Codable {
    case extInfoElementArray([EXTInfoElement])
    case purpleEXTInfo(PurpleEXTInfo)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([EXTInfoElement].self) {
            self = .extInfoElementArray(x)
            return
        }
        if let x = try? container.decode(PurpleEXTInfo.self) {
            self = .purpleEXTInfo(x)
            return
        }
        throw DecodingError.typeMismatch(EXTInfoUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EXTInfoUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .extInfoElementArray(let x):
            try container.encode(x)
        case .purpleEXTInfo(let x):
            try container.encode(x)
        }
    }
}

// MARK: - EXTInfoElement
struct EXTInfoElement: Codable {
    let id: String
    let type, mlogBaseDataType: Int
    let position: JSONNull?
    let resource: EXTInfoResource
    let alg, logInfo: String
    let reason: String?
    let matchField: Int
    let matchFieldContent: JSONNull?
    let sameCity: Bool
}

// MARK: - EXTInfoResource
struct EXTInfoResource: Codable {
    let mlogBaseData: MlogBaseData
    let mlogEXTVO: MlogEXTVO
    let userProfile: UserProfile
    let status: Int
    let shareURL: String

    enum CodingKeys: String, CodingKey {
        case mlogBaseData
        case mlogEXTVO = "mlogExtVO"
        case userProfile, status
        case shareURL = "shareUrl"
    }
}

// MARK: - MlogBaseData
struct MlogBaseData: Codable {
    let id: String
    let type: Int
    let text: String
    let interveneText: String?
    let pubTime: Int
    let coverURL: String
    let coverHeight: Int
    let greatCover: Bool
    let coverWidth, coverColor: Int
    let coverPicKey: String
    let coverDynamicURL, audio: JSONNull?
    let threadID: String
    let duration: Int

    enum CodingKeys: String, CodingKey {
        case id, type, text, interveneText, pubTime
        case coverURL = "coverUrl"
        case coverHeight, greatCover, coverWidth, coverColor, coverPicKey
        case coverDynamicURL = "coverDynamicUrl"
        case audio
        case threadID = "threadId"
        case duration
    }
}

// MARK: - MlogEXTVO
struct MlogEXTVO: Codable {
    let likedCount, commentCount, playCount: Int
    let song: AlgSongClass
    let algSong: AlgSongClass?
    let videoStartPlayTime: Int
    let canCollect: Bool
    let artistName, rcmdInfo, strongPushMark, strongPushIcon: JSONNull?
    let specialTag: String?
    let channelTag: JSONNull?
    let artists: [JSONAny]
}

// MARK: - AlgSongClass
struct AlgSongClass: Codable {
    let id: Int
    let name: String
    let coverURL: String
    let duration: Int
    let artists: [SongArtist]
    let privilege: JSONNull?
    let albumName: String
    let startTime, endTime: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name
        case coverURL = "coverUrl"
        case duration, artists, privilege, albumName, startTime, endTime
    }
}

// MARK: - SongArtist
struct SongArtist: Codable {
    let artistID: Int
    let artistName: String

    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case artistName
    }
}

// MARK: - UserProfile
struct UserProfile: Codable {
    let userID: Int
    let nickname: String
    let avatarURL: String
    let followed: Bool
    let userType: Int
    let isAnchor: Bool
    let avatarDetail: AvatarDetail

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
        case avatarURL = "avatarUrl"
        case followed, userType, isAnchor, avatarDetail
    }
}

// MARK: - AvatarDetail
struct AvatarDetail: Codable {
    let userType, identityLevel: Int?
    let identityIconURL: String?

    enum CodingKeys: String, CodingKey {
        case userType, identityLevel
        case identityIconURL = "identityIconUrl"
    }
}

// MARK: - PurpleEXTInfo
struct PurpleEXTInfo: Codable {
    let banners: [Banner]
}

// MARK: - Banner
struct Banner: Codable {
    let adLocation, monitorImpress: JSONNull?
    let bannerID: String
    let extMonitor, pid: JSONNull?
    let pic: String
    let program, video, adurlV2, adDispatchJSON: JSONNull?
    let dynamicVideoData, monitorType, adid: JSONNull?
    let titleColor: TitleColor
    let requestID: String
    let exclusive: Bool
    let scm: String
    let event, alg: JSONNull?
    let song: BannerSong?
    let targetID: Int
    let showAdTag: Bool
    let adSource, showContext: JSONNull?
    let targetType: Int
    let typeTitle: String
    let url: String?
    let encodeID: String
    let extMonitorInfo, monitorClick, monitorImpressList, monitorBlackList: JSONNull?
    let monitorClickList: JSONNull?

    enum CodingKeys: String, CodingKey {
        case adLocation, monitorImpress
        case bannerID = "bannerId"
        case extMonitor, pid, pic, program, video, adurlV2
        case adDispatchJSON = "adDispatchJson"
        case dynamicVideoData, monitorType, adid, titleColor
        case requestID = "requestId"
        case exclusive, scm, event, alg, song
        case targetID = "targetId"
        case showAdTag, adSource, showContext, targetType, typeTitle, url
        case encodeID = "encodeId"
        case extMonitorInfo, monitorClick, monitorImpressList, monitorBlackList, monitorClickList
    }
}

// MARK: - BannerSong
struct BannerSong: Codable {
    let name: String
    let id, pst, t: Int
    let ar: [Ar]
    let alia: [JSONAny]
    let pop, st: Int
    let rt: String
    let fee, v: Int
    let crbt: JSONNull?
    let cf: String
    let al: Al
    let dt: Int
    let h, m, l: H
    let a: JSONNull?
    let cd: String
    let no: Int
    let rtURL: JSONNull?
    let ftype: Int
    let rtUrls: [JSONAny]
    let djID, copyright, sID, mark: Int
    let originCoverType: Int
    let originSongSimpleData: JSONNull?
    let single: Int
    let noCopyrightRcmd: JSONNull?
    let rtype: Int
    let rurl: JSONNull?
    let mst, cp, mv, publishTime: Int

    enum CodingKeys: String, CodingKey {
        case name, id, pst, t, ar, alia, pop, st, rt, fee, v, crbt, cf, al, dt, h, m, l, a, cd, no
        case rtURL = "rtUrl"
        case ftype, rtUrls
        case djID = "djId"
        case copyright
        case sID = "s_id"
        case mark, originCoverType, originSongSimpleData, single, noCopyrightRcmd, rtype, rurl, mst, cp, mv, publishTime
    }
}

enum TitleColor: String, Codable {
    case blue = "blue"
    case red = "red"
}

// MARK: - BlockUIElement
struct BlockUIElement: Codable {
    let subTitle: FluffySubTitle?
    let button: Button?
    let rcmdShowType: RcmdShowType
}

// MARK: - FluffySubTitle
struct FluffySubTitle: Codable {
    let title: String
    let titleImgURL: String?

    enum CodingKeys: String, CodingKey {
        case title
        case titleImgURL = "titleImgUrl"
    }
}

// MARK: - GuideToast
struct GuideToast: Codable {
    let hasGuideToast: Bool
    let toastList: [JSONAny]
}

// MARK: - PageConfig
struct PageConfig: Codable {
    let refreshToast, nodataToast: String
    let refreshInterval: Int
    let title: JSONNull?
    let fullscreen: Bool
    let abtest, songLabelMarkPriority: [String]
    let songLabelMarkLimit: Int
    let homepageMode: String
    let showModeEntry: Bool
    let orderInfo: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
