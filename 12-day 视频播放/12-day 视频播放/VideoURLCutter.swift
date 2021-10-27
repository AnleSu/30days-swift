//
//  VideoURLCutter.swift
//  12-day 视频播放
//
//  Created by Anlesu on 2021/10/13.
//

import Foundation
import UIKit
import AVFoundation
extension String {
    var convert: NSString {
        return (self as NSString)
    }
}

public class VideoURLCutter: NSObject {
//    默认闭包complation是@nonescaping的,只需要声明成@escaping即可
    public func cropVideoURL(videoURL url: NSURL, startTime: CGFloat, duration: CGFloat, complation: @escaping ((_ videoPath: NSURL?, _ error: NSError?) -> Void)) {
    
        DispatchQueue.global(qos: .userInitiated).async{
            let asset = AVURLAsset(url: url as URL, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
                
            }
            
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
                
            }
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = NSURL(fileURLWithPath: outputURL) as URL
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4
                let start = CMTimeMakeWithSeconds(Float64(startTime), preferredTimescale: 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), preferredTimescale: 600)
                let range = CMTimeRangeMake(start: start, duration: duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously(completionHandler: {
                    switch exportSession.status {
                    case AVAssetExportSession.Status.completed:
                        complation(exportSession.outputURL as NSURL?, nil)
                    case AVAssetExportSession.Status.failed:
                        print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSession.Status.cancelled:
                        print("Failed: \(String(describing: exportSession.error))")
                    default:
                        print("default case")
                    }
                })

               
            }
        }
    }
}
