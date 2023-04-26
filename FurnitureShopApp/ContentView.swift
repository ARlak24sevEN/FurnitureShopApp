//
//  ContentView.swift
//  FurnitureShopApp
//
//  Created by Arlak Abdulloh on 26/4/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("Bg")
                .ignoresSafeArea()
            VStack{
                AppBarView()
                TagLineView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Image("menu")
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
            Spacer()
            Button(action:{}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Fine the \nBest ")
            .foregroundColor(Color("Primary"))
            .font(.custom("PlayfairDisplay-Regular", size: 28))
        + Text("Furniture!")
            .foregroundColor(Color("Primary"))
            .font(.custom("PlayfairDisplay-Bold", size: 28))
    }
}
