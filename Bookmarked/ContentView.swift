//
//  ContentView.swift
//  Bookmarked
//
//  Created by Nouf  on 13/05/1444 AH.
//

import SwiftUI

let navBarAppearance = UINavigationBar.appearance()

let bookmarkImages = [
    bookmark(Id: 0, bookmarkImage:"bookmark1", tagImage:"rectangletTag", placeName: "Riaydh Front", rating: "4.0", isSelected: false, placeDetail: "place 1 details"),
    bookmark(Id: 1, bookmarkImage:"bookmark2",  tagImage:"rectangletTag", placeName: "Zamakan cafe", rating: "3.0", isSelected: false, placeDetail: "place 2 details"),
    bookmark(Id: 2, bookmarkImage:"bookmark3",  tagImage:"rectangletTag", placeName: "Boulevard", rating: "4.0", isSelected: false, placeDetail: "place 3 details"),
    bookmark(Id: 3, bookmarkImage:"bookmark4",  tagImage:"rectangletTag", placeName: "Knoll cafe", rating: "3.8", isSelected: false, placeDetail: "place 4 details")
    
]

let tagsticker = [
    tagsContainer(tagName:"vagan", tagSymbol:"leaf.fill", tagColor:"greencolor"),
    tagsContainer(tagName:"24H", tagSymbol:"clock.fill", tagColor:"maincolorfont"),
    tagsContainer(tagName:"Children", tagSymbol:"figure.2.and.child.holdinghands", tagColor:"orangecolor"),
    tagsContainer(tagName:"Study", tagSymbol:"books.vertical.fill", tagColor:"marooncolor"),
    tagsContainer(tagName:"Entertainment", tagSymbol:"ticket.fill", tagColor:"yellowcolor"),
    tagsContainer(tagName:"Budget", tagSymbol:"dollarsign.circle.fill", tagColor:"muavecolor"),
    
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
                                    NavigationLink(destination: DetailView(bk:sub )){
                                        Image(sub.bookmarkImage).resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
                                    }
                                    Image(sub.tagImage).padding(.top,-66)
                                    Text(sub.placeName).padding(.top,-66).padding(.leading,5).foregroundColor(.white).bold()
                                    Text(sub.rating).padding(.top,-60).padding(.leading,5).foregroundColor(.white)
                                    Text(Image(systemName: "star.fill")).padding(.top,-70).padding(.leading,35).foregroundColor(.yellow)
                                    Button{
                                        sub.isSelected.toggle()
                   
                                    } label: {
                                        Image(systemName: sub.isSelected ? "bookmark": "bookmark.fill").foregroundColor(Color("secondaryColor")).font(.system(size: 30))
                                    }.padding(.top,-330).padding(.leading,320)
                                        
                                }
                                
                            }
                        }.padding(.top,40)
     
                    }
                    
                }//end of zstack
                }
            
        }.navigationBarTitle(Text("My Profile"))
    
                    
        }
        
    }



struct DetailView : View {
    let bk: bookmark
    var body: some View {
        
        VStack{
            ZStack{
                ScrollView{
                    
                    Image(bk.bookmarkImage)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode:.fill)
                        .frame(height: 390).padding(.top,-90)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                    ZStack{
                        RoundedRectangle(cornerRadius: 40).fill(Color("background1").gradient).frame(width: 390,height: 600).padding(.top,-50)
                        HStack{
                            
                        
                            VStack{
                                Text(bk.placeName)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("maincolorfont"))
                                    .padding(.trailing)
                                    .padding(.vertical,1.0)
                                Text(bk.placeDetail)
                                    .font(.callout)
                                    .foregroundColor(Color("caption"))
                                
                        
                       
                            }.padding(.top,-40)
                            
                               Spacer()
                            VStack{
                                HStack{
                                    Text(bk.rating)
                                        .foregroundColor(Color("caption"))
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                        .padding(.vertical,8.0)
                                    
                                }.padding(.top,-40)
                                
                                HStack{
                                    Text("100")
                                        .foregroundColor(Color("caption"))
                                    
                                    //                                    Image(systemName: "bookmark")
                                    //                                        .foregroundColor(Color("secondaryColor"))
                                    //                                        .padding(.bottom,1)
                                    Button{
                                        bk.isSelected.toggle()
                                        
                                    } label: {
                                        Image(systemName: bk.isSelected ? "bookmark.fill": "bookmark").foregroundColor(Color("secondaryColor")).font(.system(size: 22))
                                    }
                                    
                                }
                            }
                        }.padding(.horizontal, 17)
                            .padding(.bottom,480)
                        LazyHGrid(rows: rows, spacing: 5) {
                            ForEach(tagsticker){ tag in
                                          HStack {
                                              Text(tag.tagName)
                                                  .foregroundColor(Color(tag.tagColor))
                                              Image(systemName: tag.tagSymbol)
                                                  .foregroundColor(Color(tag.tagColor))
                      
                                          }.padding(6).background{
                                              RoundedRectangle(cornerRadius: 10)
                                                  .stroke(Color(tag.tagColor),lineWidth: 2)
                                                  .foregroundColor(.clear)
                                          }
                      
                                      }
                        }.padding(.top,-300)
                      
                    }
                }.frame(maxWidth: .infinity)
                //Spacer()
                
            }
           
            .navigationBarTitleDisplayMode(.inline)
            
        }
//        Text(bk.placeName)
//        Image(bk.bookmarkImage).resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
//
//        Text(bk.rating)
//        Text(bk.tagImage)
        //Text(bk.)
           
    }
}

struct bookmark: Identifiable {
  var id = UUID()
  var Id = Int()
  var bookmarkImage: String
  var tagImage: String
  var placeName: String
  var rating: String
    
  @State var isSelected : Bool
  var placeDetail: String
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct tagsContainer: Identifiable{
    var id = UUID()
    var tagName: String
    var tagSymbol: String
    var tagColor: String
}

let rows = [
    GridItem(.fixed(30), spacing: 1),
    GridItem(.flexible(minimum: 20, maximum: 50)),
]

func customNavBarTitle() {

       navBarAppearance.largeTitleTextAttributes = [
           .foregroundColor : UIColor(Color("greencolor")),
       ]

   }
