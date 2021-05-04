//
//  AutoLockView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/21.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingAutoLockView: View {
    @EnvironmentObject var settingData:SettingData

    var body: some View {
        Toggle(isOn: $settingData.autolock) {
            Text("")
        }
        .labelsHidden()
    }
}

struct AutoLockView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAutoLockView().environmentObject(SettingData())
    }
}
