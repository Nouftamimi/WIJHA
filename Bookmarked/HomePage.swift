//
//  HomePage.swift
//  Bookmarked
//
//  Created by Nouf  on 20/05/1444 AH.
//

import SwiftUI

let saveimages = [
    saveinmage(saves:"category7", starlove: "star", tags:"rectangletTag", places: "Nerd Cafe", rates: "4.0", isSelected: false),
    saveinmage(saves:"kidsl", starlove: "star", tags:"rectangletTag", places: "Playgound", rates: "3.0", isSelected: false),
    saveinmage(saves:"bookmark3", starlove: "star", tags:"rectangletTag", places: "Boulevard", rates: "4.0", isSelected: false),
    saveinmage(saves:"bookmark4", starlove: "star", tags:"rectangletTag", places: "Knoll Library", rates: "3.8", isSelected: false)
]

//let trendingimages = [
//    trending(trendingimages:"trending1",starImage: "star", tagImage:"rectangletTag", placeName: "Riaydh Front", rating: "4.0", placeDetails: "place details", isSelected: false),
//    trending(trendingimages:"trending2",starImage: "star", tagImage:"rectangletTag", placeName: " Deep Brown", rating: "4.0", placeDetails: "place details", isSelected: false),
//    trending(trendingimages:"trending3",starImage: "star", tagImage:"rectangletTag", placeName: " Riyadh Park", rating: "4.0", placeDetails: "place details", isSelected: false),
//    trending(trendingimages:"category8",starImage: "star", tagImage:"rectangletTag", placeName: " BLANCA", rating: "4.0", placeDetails: "place details", isSelected: false),
//]




struct saveinmage: Identifiable {
    var id = UUID()
    var saves: String
    var starlove: String
    var tags: String
    var places: String
    var rates: String
    var isSelected: Bool
    
}

//struct trending: Identifiable{
//    var id = UUID()
//    var trendingimages: String
//    var starImage: String
//    var tagImage: String
//    var placeName: String
//    var rating: String
//    var placeDetails: String
//    var isSelected: Bool
//
//}

struct HomePage: View {
    

    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    //@State var isSelected = false
    
    init() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .systemBackground
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        UISearchBar.appearance().tintColor = UIColor.white
        //UISearchBar.appearance().backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 100)
        //        UISearchBar.appearance().barTintColor = UIColor(red: 400, green: 300, blue: 242, alpha: 100)
        //        UISearchBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        NavigationView{
            NavigationStack{
                
                ZStack{
                    VStack{
                        
                        Image("header")
                            .resizable()
                            .frame(width: 400, height: 170)
                            .ignoresSafeArea()
                            .padding([.top],-150)
                        
                        ScrollView(.vertical){
                            
                            
                            HStack{
                                
                                Text("Category")
                                    .font(.custom("", fixedSize: 18))
                                    .fontWeight(.medium)
                                //                                .fontDesign(.rounded)
                                
                                
                                Spacer()
                                //                            NavigationLink("More"){
                                //
                                //                                category()
                                //
                                //                            } .foregroundColor(Color("secondaryColor"))
                                
                                Button{
                                }label: {
                                    NavigationLink(destination: category()){
                                        Text("more")
                                            .foregroundColor(Color(red: 0.977, green: 0.53, blue: 0.434))
                                            .fontWeight(.medium)
                                        //                                   .fontDesign(.rounded)
                                    }
                                    
                                    Image(systemName: "chevron.backward")                                   .foregroundColor(.orange)
                                        .rotationEffect(.degrees(180))
                                    
                                }
                                
                            }.padding(.horizontal)
                            ScrollView(.horizontal){
                                
                                HStack{
                                    Image("v2")
                                    Image("u8")
                                    Image("t8")
                                    Image("ms0")
                                    Image("cj")
                                    
                                    
                                    
                                }.padding(.horizontal)
                                
                                
                                
                            }
                            Divider()
                            
                            Text("Trending")
                                .foregroundColor(.white)
                                .frame(width: 77, height: 22)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.969, green: 0.47, blue: 0.385)/*@END_MENU_TOKEN@*/)
                                .cornerRadius(7.5)
                                .font(.custom("", fixedSize: 16))
                                .fontWeight(.medium)
                            //.fontDesign(.rounded)
                                .padding(.leading,-185)
                            
                            
                            
                            
                            
                            
                            
                            HStack{
                                ZStack{
                                    ScrollView(.horizontal){
                                        LazyHGrid (rows: [GridItem(.fixed(130))]) {
                                            
                                            ForEach(bookmarkImages) { sub in
                                                
                                                VStack(alignment: .leading){
                                                    NavigationLink(destination: PlaceDeatil(bk: sub)){
                                                        Image(sub.bookmarkImage)
                                                            .resizable()
                                                            .cornerRadius(10)
                                                            .frame(width: 80, height: 100)
                                                            .padding(.top,-40)
                                                            .frame(width: 96, height: 153)
                                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                                                            .cornerRadius(8)
                                                    }
                                                    
                                                    Text(sub.placeName)
                                                        .font(.custom("", fixedSize: 12))
                                                        .fontWeight(.medium)
                                                        .padding(.top,-50)
                                                    
                                                    
                                                    Text(sub.rating)
                                                        .font(.custom("", fixedSize: 12))
                                                        .padding(.top,-40)
                                                        .padding(.leading,5)
                                                        .fontWeight(.medium)
                                                    
                                                    Image(systemName:"star.fill")
                                                        .padding(.top,-50).padding(.leading,25)
                                                        .foregroundColor(.yellow)
                                                    
                                                    
                                                    
                                                }
                                            }
                                        }.padding(.leading)
                                    }
                                }
                                
                            }//end of zstack
                            
                            Divider()
                            
                            
                            
                            
                            Text("Latest")
                                .font(.custom("", fixedSize: 18))
                                .fontWeight(.medium)
                            //                            .fontDesign(.rounded)
                                .padding(.horizontal,-175)
                            
                            ZStack{
                                ScrollView{
                                    LazyVGrid (columns: [GridItem(.fixed(130))]) {
                                        
                                        ForEach(bookmarkImages) { sub in
                                            
                                            VStack(alignment: .leading){
                                                NavigationLink(destination: PlaceDeatil(bk: sub)){
                                                    Image(sub.bookmarkImage).resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
                                                }
                                                Image(sub.tagImage).padding(.top,-66)
                                                Text(sub.placeName).padding(.top,-66).padding(.leading,5).foregroundColor(.white).bold()
                                                Text(sub.rating).padding(.top,-60).padding(.leading,5).foregroundColor(.white)
                                                Image(systemName:"star.fill").padding(.top,-73).padding(.leading,35).foregroundColor(.yellow)
                                                Button {
                                                    sub.isSelected.toggle()
                                                } label: {
                                                    if(sub.isSelected == false){
                                                        Image(systemName:"bookmark.fill")
                                                    }else{
                                                        Image(systemName:"bookmark")
                                                        
                                                    }
                                                    
                                                }.font(.system(size: 30)).foregroundColor(.black)
                                                
                                                //                                                Button{
                                                //                                                    sub.isSelected.toggle()
                                                //                                                    //sub.isSelected = true
                                                //                                                    //print("bookmark fill")
                                                //
                                                //                                                }
                                                //                                            label: {
                                                //                                                if(isSelected == true){
                                                //                                                    Image(systemName:"bookmark.fill")
                                                //                                                }else{
                                                //                                                    Image(systemName:"bookmark")
                                                //
                                                //                                                }
                                                ////                                                Image(systemName: sub.isSelected ? "bookmark.fill" : "bookmark")
                                                ////                                                    .font(.system(size: 30))
                                                ////
                                                ////                                                    .foregroundColor(Color("secondaryColor"))
                                                ////
                                                //                                            }.padding(.top,-330).padding(.leading,320)
                                                
                                             

                                            }
                                            
                                        }
                                    }.padding(.top,40)
                                }
                                
                            }//end of zstack
                            
                        }
                    }
                    
                    
                }
                .searchable(text: $searchText, prompt: "What is new in Riyadh")
                //background
                .background(Color("background1"))
                .navigationBarItems(trailing:
                                        Button(action: {
                    
                }) {
                    NavigationLink(destination: ContentView()){
                        Image(systemName: "bookmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("secondaryColor"))
                    }
                }
                )
                
            }
        }.navigationBarBackButtonHidden()
        
    }
    
}

//struct TrendingPlace: View {
//    let trend: trending
//
//    var body: some View {
//        ZStack{
//            ZStack{
//                ScrollView{
//
//                    Image(trend.trendingimages)
//                        .renderingMode(.original)
//                        .resizable()
//                        .aspectRatio(contentMode:.fill)
//                        .frame(height: 390).padding(.top,-90)
//                        .frame(maxWidth: UIScreen.main.bounds.width)
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 40).fill(Color("background1").gradient).frame(width: 390,height: 600).padding(.top,-50)
//                        HStack{
//
//
//                            VStack{
//                                Text(trend.placeName)
//                                    .font(.title3)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color("maincolorfont"))
//                                    .padding(.trailing)
//                                    .padding(.vertical,1.0)
//                                Text(trend.rating)
//                                    .font(.callout)
//                                    .foregroundColor(Color("caption"))
//
//
//
//                            }.padding(.top,-40)
//
//                            Spacer()
//                            VStack{
//                                HStack{
//                                    Text(trend.starImage)
//                                        .foregroundColor(Color("caption"))
//                                    Image(systemName: "star.fill")
//                                        .foregroundColor(Color.yellow)
//                                        .padding(.vertical,8.0)
//
//                                }.padding(.top,-40)
//
//                                HStack{
//                                    Text("100")
//                                        .foregroundColor(Color("caption"))
//
//                                    //                                    Image(systemName: "bookmark")
//                                    //                                        .foregroundColor(Color("secondaryColor"))
//                                    //                                        .padding(.bottom,1)
//                                    //                                    Button{
//                                    //                                        trend.isSelected.toggle()
//                                    //
//                                    //                                    } label: {
//                                    //                                        Image(systemName: trend.isSelected ? "bookmark.fill": "bookmark").foregroundColor(Color("secondaryColor")).font(.system(size: 22))
//                                    //                                    }
//
//                                }
//                            }
//                        }.padding(.horizontal, 17)
//                            .padding(.bottom,480)
//                        LazyHGrid(rows: rows, spacing: 5) {
//                            ForEach(tagsticker){ tag in
//                                HStack {
//                                    Text(tag.tagName)
//                                        .foregroundColor(Color(tag.tagColor))
//                                    Image(systemName: tag.tagSymbol)
//                                        .foregroundColor(Color(tag.tagColor))
//
//                                }.padding(6).background{
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color(tag.tagColor),lineWidth: 2)
//                                        .foregroundColor(.clear)
//                                }
//
//                            }
//                        }.padding(.top,-300)
//
//                    }
//                }.frame(maxWidth: .infinity)
//                //Spacer()
//
//            }
//
//            .navigationBarTitleDisplayMode(.inline)
//
//        }
//    }
//}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
