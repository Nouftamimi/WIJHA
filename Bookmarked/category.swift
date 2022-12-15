//
//  category.swift
//  Bookmarked
//
//  Created by Nouf  on 15/05/1444 AH.
//

import SwiftUI


struct category: View {
    
    //let cate: photo
    
    @Environment(\.colorScheme) var colorScheme
    let photos = [ photo(categoryphotos: "entertainmentPlaces"),
                   photo(categoryphotos: "vegan friendly"), photo(categoryphotos: "budget friendly"), photo(categoryphotos: "memorable"), photo(categoryphotos: "24Hour"), photo(categoryphotos: "studyCafe"),photo(categoryphotos: "familyplaces"),photo(categoryphotos: "NewPlaces")]
    
    var body: some View {
        NavigationView{
            
            
            VStack {
                Image("header").resizable().position(x:195,y: 120)
                    .frame(width: 391, height:275).ignoresSafeArea()
                    .padding(.top,-135)
                ZStack{
                    ScrollView {
                        LazyVGrid (columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]){
                            ForEach(photos){ sub in
                                VStack(alignment: .leading){
                                    NavigationLink(destination: ContentView()){
                                        Image(sub.categoryphotos).resizable().frame(width: 220,height: 220).padding(.top,-40)
                                    }
                                }
                            }
                        }.padding(.top,25)
                       
                    }
                    
                }
            }
          
        }.navigationBarBackButtonHidden()//end of navigation view
    }
    struct photo: Identifiable {
        var id = UUID()
        var categoryphotos: String
        
    }
    
    struct category_Previews: PreviewProvider {
        static var previews: some View {
            category()
        }
    }
}
