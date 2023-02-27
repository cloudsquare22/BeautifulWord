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
    @State var onSettingView = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    Text(musicData.lyrics)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .font(Font.custom(settingData.fontNames[settingData.selectFontIndex], size: CGFloat(settingData.selectFontSize)))
                        .lineSpacing(8.0)
                        .frame(width: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .onTapGesture(count: 2, perform: {
                    self.musicData.previous()
                })
                .onTapGesture(perform: {
                    self.musicData.next()
                })
            }
            .navigationBarTitle(Text(musicData.title), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.onSettingView.toggle()
            }, label: {
                Image(systemName: "gearshape")
            }).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/))
            .sheet(isPresented: self.$onSettingView, onDismiss: {
                self.settingData.saveData()
            }, content: {
                SettingView()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MusicData()).environmentObject(SettingData())
    }
}
