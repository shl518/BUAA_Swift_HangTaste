//
//  testview.swift
//  SUIHangTaste
//
//  Created by Shl on 2022/11/1.
//

import SwiftUI

struct testview: View {
    @State var isPresented = false
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:ContentView(name: "排骨"),)
            }
        }
    }
}

struct testview_Previews: PreviewProvider {
    static var previews: some View {
        testview()
    }
}
