////
////  ManagerConfig.swift
////  Demo_firebase_remote_config
////
////  Created by Anh vũ on 1/21/21.
////
//
//import UIKit
//import FirebaseRemoteConfig
//
//enum RemoteConfigKey: String {
//    case serverUrl = "api_url"
//}
//
//struct RemoteConfigManager {
//  // local default value
//    static let baseUrl = "api.local.url"
// 
//    static let shared = RemoteConfigManager()
//    
//    fileprivate var remoteConfig: RemoteConfig
//    
//    fileprivate init() {
//        self.remoteConfig = RemoteConfig.remoteConfig()
//        self.setDefaultValue()
////        #if DEBUG
////            if let debugSetting = RemoteConfigSetti {
////                self.remoteConfig.configSettings = debugSetting
////            }
////        #endif
//    }
//
//     func setDefaultValue() {
//        let url = RemoteConfigManager.baseUrl as NSString
//        remoteConfig.setDefaults([RemoteConfigKey.serverUrl.rawValue: url])
//    }
//    
//    func getValue(fromKey key: RemoteConfigKey) -> String {
//        
//        if let value = self.remoteConfig.configValue(forKey: key.rawValue).stringValue {
//            return value
//        }
//        return ""
//    }
//    
//    func fetchRemoteConfig(_ finish: DefaultVoidClosure?) {
//        var expirationDuration = 0
//        if self.remoteConfig.configSettings.isDeveloperModeEnabled {
//            expirationDuration = 0
//        }
//        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, _) in
//            Log.debugLog("RemoteConfigManager fetchRemoteConfig status = \(status.rawValue)")
//            if status == RemoteConfigFetchStatus.success {
//                self.remoteConfig.activateFetched()
//                let url =  RemoteConfigManager.shared.getValue(fromKey: .serverUrl)
//                Log.debugLog(" RemoteConfigManager RemoteConfigFetchStatus.success \n new URL = \(url)")
//            }
//            finish?()
//        }
//    }
//    
//}
