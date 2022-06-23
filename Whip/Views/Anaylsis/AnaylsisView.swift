//
//  AnaylsisView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AnaylsisView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.gray)
                    .frame(width: 180, height: 20)
                    .padding(.leading, 20)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ZStack {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 270, height: 120)
                                .foregroundColor(.carrot)
                            
                            Text("당근 지수")
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                
                        }
                        
                        HStack {
                            Spacer()
                            Image("Carrot")
                                .resizable()
                                .frame(width: 90, height: 170)
                        }
                    }
                    
                    ZStack {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 270, height: 120)
                                .foregroundColor(.whip)
                            
                            Text("채찍 지수")
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .padding(.leading, 20)
            }
            
            Divider()
                .padding(.top, 15)
                .padding(.bottom, 25)
            
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.gray)
                    .frame(width: 180, height: 20)
                    .padding(.leading, 20)
                    
                Spacer()
            }
            .padding(.bottom, 15)
            
            HStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.gray)
                    .frame(width: 240, height: 20)
                    .padding(.leading, 20)
                Spacer()
            }
            .padding(.bottom, 25)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(height: 150)
                .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

struct AnaylsisView_Previews: PreviewProvider {
    static var previews: some View {
        AnaylsisView()
    }
}
