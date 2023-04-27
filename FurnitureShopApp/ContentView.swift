//
//  ContentView.swift
//  FurnitureShopApp
//
//  Created by Arlak Abdulloh on 26/4/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex:Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        ZStack{
            Color("Bg")
                .ignoresSafeArea()
            VStack(alignment: .leading){
                AppBarView()
                TagLineView()
                    .padding()
                SearchAndScanView()
                
                
                ScrollView (.horizontal,showsIndicators: false){
                    HStack(){
                        ForEach(0 ..< categories.count) { i in
                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                .onTapGesture {
                                    selectedIndex = i
                                }
                        }
                    }
                }
                
                Text("Popular")
                    .font(.custom("PlayfairDisplay-Bold", size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 4) { i in
                            ProductCardView(image: Image("chair_\(i+1)"))
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                }
                
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
            .padding(.horizontal)
        }
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

struct SearchAndScanView: View {
    @State private var search :String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                TextField("Search furniture", text: $search)
            }
            .padding(.all,20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}){
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .padding(.all,9)
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color(.black) .opacity(0.5))
            if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image : Image
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 210, height: 200)
                .cornerRadius(20)
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack{
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color(.white))
        .cornerRadius(20)
    }
}
