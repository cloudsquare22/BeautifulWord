//
//  SettingAboutView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/09.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingAboutView: View {
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("Beautiful Word Version \(version)")
            HStack {
                Image("cloudsquare")
                Text("©️ 2020-2023 cloudsquare.jp. All rights reserved.")
                    .font(.caption)
            }
        }
    }
}

struct SettingAboutView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAboutView()
    }
}
