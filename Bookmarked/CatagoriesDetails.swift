//
//  CatagoriesDetails.swift
//  Bookmarked
//
//  Created by Nouf  on 21/05/1444 AH.
//

import SwiftUI

struct CatagoriesDetails: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView{

            
            VStack {
                ZStack{
                    Image("header").resizable()
                        .frame(width: 391, height:275).ignoresSafeArea()
                        .padding(.top,-200)
                    
                    Image("BookmarkHeader").resizable().frame(width: 170,height: 170).padding(.top,30)
                }
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
            
        }
    }
}

struct CatagoriesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CatagoriesDetails()
    }
}
