//
//  ContentView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/09/28.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var musicData: MusicData
    @EnvironmentObject var settingData: SettingData

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    Text(musicData.lyrics).padding().font(Font.custom(settingData.fontNames[settingData.selectFontIndex], size: CGFloat(settingData.selectFontSize)))
                        .frame(width: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .navigationBarTitle(Text(musicData.title), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: SettingView(), label: {Image("setting")}))
                .onTapGesture(count: 2, perform: {
                    self.musicData.previous()
                })
                .onTapGesture(perform: {
                    self.musicData.next()
                })
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MusicData()).environmentObject(SettingData())
    }
}
