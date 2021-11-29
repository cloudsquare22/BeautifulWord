//
//  SettingFontView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/09.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingFontView: View {
    @EnvironmentObject var musicData: MusicData
    @EnvironmentObject var settingData:SettingData
    
    var body: some View {
        VStack {
            Text(musicData.title).padding().font(Font.custom(settingData.fontNames[settingData.selectFontIndex], size: CGFloat(settingData.selectFontSize)))
            Picker(selection: $settingData.selectFontIndex, label: Text("")) {
                ForEach(0 ..< settingData.fontNames.count) {
                    Text(self.settingData.fontNames[$0])
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            .labelsHidden()
            HStack {
                Slider(value: $settingData.selectFontSize, in: 8...32, step: 1.0)
                Text("\(Int(settingData.selectFontSize))")
            }.padding()
        }
    }
}

struct SettingFontView_Previews: PreviewProvider {
    static var previews: some View {
        SettingFontView().environmentObject(MusicData()).environmentObject(SettingData())
    }
}
