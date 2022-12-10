//
//  ContentView.swift
//  Bookmarked
//
//  Created by Nouf  on 13/05/1444 AH.
//

import SwiftUI

let bookmarkImages = [
    bookmark(bookmarkImage:"bookmark1", starImage: "star", tagImage:"rectangletTag", placeName: "Riaydh Front", rating: "4.0"),
    bookmark(bookmarkImage:"bookmark2", starImage: "star", tagImage:"rectangletTag", placeName: "Zamakan cafe", rating: "3.0"),
    bookmark(bookmarkImage:"bookmark3", starImage: "star", tagImage:"rectangletTag", placeName: "Boulevard", rating: "4.0"),
    bookmark(bookmarkImage:"bookmark4", starImage: "star", tagImage:"rectangletTag", placeName: "Knoll cafe", rating: "3.8")
]

struct ContentView: View {
    var body: some View {
        
        NavigationView{

            
            VStack {
                ZStack{
                    Image("header").resizable()
                        .frame(width: 391, height:275).ignoresSafeArea()
                        .padding(.top,-200)
                    
                    Image("budget friendly").resizable().frame(width: 170,height: 170).padding(.top,30)
                }
                ZStack{
                    ScrollView{
                        LazyVGrid (columns: [GridItem(.fixed(130))]) {
                            
                            ForEach(bookmarkImages) { sub in
                                VStack(alignment: .leading){
                                    Image(sub.bookmarkImage).resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
                                    Image(sub.tagImage).padding(.top,-66)
                                    Text(sub.placeName).padding(.top,-66).padding(.leading,5).foregroundColor(.white).bold()
                                    Text(sub.rating).padding(.top,-60).padding(.leading,5).foregroundColor(.white)
                                    Image(sub.starImage).padding(.top,-70).padding(.leading,35)
                                    
                                    Button{
                                        print("bookmark fill")
                                    } label: {
                                        Label("", systemImage: "bookmark.fill").padding(.top,-330).padding(.leading,320).foregroundColor(Color("secondaryColor")).font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }.padding(.top,40)
                    }
                    
                }//end of zstack
                }
            

           
                   
                    
                    
                    
        }//navigation vies

            
                    
        }
        
    }

struct bookmark: Identifiable {
  var id = UUID()
  var bookmarkImage: String
  var starImage: String
  var tagImage: String
  var placeName: String
  var rating: String
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
