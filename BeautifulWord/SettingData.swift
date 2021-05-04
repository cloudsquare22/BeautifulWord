//
//  SettingData.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/10.
//  Copyright © 2019 shi-n. All rights reserved.
//

import Foundation
import SwiftUI

final class SettingData: ObservableObject  {
    @Published var fontNames:[String] = []
    @Published var selectFontSize:Double = 14.0
    @Published var selectFontIndex = 0
    @Published var autolock = true {
        willSet {
            setIsIdleTimerDisabled(lock: newValue)
        }
    }
    
    var selctFontName:String {
        get {
            return fontNames[selectFontIndex]
        }
    }
    
    init() {
        for family in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: family) {
                fontNames.append(fontName)
            }
        }
        fontNames.sort()

        if let saveFontName = UserDefaults.standard.object(forKey: "fontName") as? String {
            for (index, fontName) in fontNames.enumerated() {
                if fontName == saveFontName {
                    selectFontIndex = index
                    print("Font \(saveFontName):\(fontName):\(selectFontIndex)")
                    break
                }
            }
        }
        if let fontSize = UserDefaults.standard.object(forKey: "fontSize") as? Double {
            selectFontSize = fontSize
        }
        
        if let lock = UserDefaults.standard.object(forKey: "autolock") as? Bool {
            autolock = lock
        }
        setIsIdleTimerDisabled(lock: autolock)
    }
    
    func saveData() {
        UserDefaults.standard.set(fontNames[selectFontIndex], forKey: "fontName")
        UserDefaults.standard.set(selectFontSize, forKey: "fontSize")
        UserDefaults.standard.set(autolock, forKey: "autolock")
    }
    
    func setIsIdleTimerDisabled(lock:Bool) {
        print(lock)
        UIApplication.shared.isIdleTimerDisabled = !lock
    }

}
