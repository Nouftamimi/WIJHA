//
//  PlaceDeatil.swift
//  Bookmarked
//
//  Created by Nouf  on 21/05/1444 AH.
//

import SwiftUI


struct PlaceDeatil: View {
    
    
    //@StateObject private var PlaceDetail =  HomePage()
    let bk: bookmark
    //let trend: trending
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



struct PlaceDeatil_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDeatil(bk: bookmark(bookmarkImage: "", tagImage: "", placeName: "", rating: "", isSelected: false, placeDetail: ""))
    }
}

