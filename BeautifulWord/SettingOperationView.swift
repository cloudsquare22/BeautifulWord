//
//  SettingOperationView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/09.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingOperationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Tap : Next song")
            Text("2 Tap : Previous song")
        }
    }
}

struct SettingOperationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingOperationView()
    }
}
