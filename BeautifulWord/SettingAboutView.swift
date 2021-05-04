//
//  SettingAboutView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/09.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingAboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Ver 2.0")
            Text("Copyright (c) 2020 cloudsquare.jp. All rights reserved.")
                .font(.caption)
        }
    }
}

struct SettingAboutView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAboutView()
    }
}
