//
//  MyProfileView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct MyProfileView: View {
    let remainingBudgetPercent: Float = 0.7
    let carrotIndexPercent: Float = 0.72
    let whipIndexPercent: Float = 0.48
    
    let tags: [String] = ["데이터", "갓생살기", "재테크", "자기계발", "개발자", "코딩"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("마이페이지")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 32, leading: 24, bottom: 16, trailing: 24))
                        Spacer()
                    }
                    Card(
                        AnyView(
                            VStack(spacing: 16) {
                                HStack {
                                    Text("6월 남은 예산")
                                        .font(.system(size: 18))
                                    Spacer()
                                    Image(systemName: "pencil")
                                        .font(.system(size: 21))
                                }
                                HStack(alignment: .bottom) {
                                    Text("176,000원")
                                        .font(.system(size: 28))
                                        .fontWeight(.bold)
                                    Text("/ 500,000원")
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.modernGray)
                                            .frame(width: geo.size.width, height: 10)
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.fontColor)
                                            .frame(width: geo.size.width * CGFloat(self.remainingBudgetPercent), height: 10)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                            .offset(x: geo.size.width * CGFloat(self.remainingBudgetPercent) - 9)
                                        
                                    }
                                }
                                
                            }
                        ),
                        color: nil
                    )
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    Card(
                        AnyView(
                            VStack(spacing: 16) {
                                HStack {
                                    Text("당근지수")
                                        .font(.system(size: 18))
                                    Spacer()
                                }
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.modernGray)
                                            .frame(width: geo.size.width, height: 10)
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.carrot)
                                            .frame(width: geo.size.width * CGFloat(self.carrotIndexPercent), height: 10)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                            .offset(x: geo.size.width * CGFloat(self.carrotIndexPercent) - 9)
                                        Text("72점")
                                            .font(.system(size: 11))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.carrot)
                                            .offset(x: geo.size.width * CGFloat(self.carrotIndexPercent) - 18, y: 16)
                                        
                                    }
                                }
                                Spacer().frame(height: 5)
                                HStack {
                                    Text("채찍지수")
                                        .font(.system(size: 18))
                                    Spacer()
                                }
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.modernGray)
                                            .frame(width: geo.size.width, height: 10)
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.whip)
                                            .frame(width: geo.size.width * CGFloat(self.whipIndexPercent), height: 10)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                            .offset(x: geo.size.width * CGFloat(self.whipIndexPercent) - 9)
                                        Text("48점")
                                            .font(.system(size: 11))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.whip)
                                            .offset(x: geo.size.width * CGFloat(self.whipIndexPercent) - 18, y: 16)
                                        
                                    }
                                }
                                Spacer().frame(height: 0)
                            }
                        ),
                        color: nil
                    )
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    Card(
                        AnyView(
                            VStack(spacing: 16) {
                                HStack {
                                    Text("규환님의 관심사")
                                        .font(.system(size: 18))
                                    Spacer()
                                    Image(systemName: "pencil")
                                        .font(.system(size: 21))
                                }
                                TagCloudView(tags: tags)
                            }
                        ),
                        color: nil
                    )
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    CustomDivider()
                        .padding([.top, .bottom], 16)
                    HStack {
                        Text("완료한 챌린지")
                            .font(.system(size: 18, weight: .medium))
                        Spacer()
                    }
                    .padding([.leading, .trailing], 24)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    Card(
                        AnyView(
                            HStack {
                                Text("당근 챌린지")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.carrot)
                                Spacer()
                                Text("14개")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.fontColor)
                            }
                        ),
                        color: nil
                    )
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    
                    Card(
                        AnyView(
                            HStack {
                                Text("채찍 챌린지")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.whip)
                                Spacer()
                                Text("12개")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.fontColor)
                            }
                        ),
                        color: nil
                    )
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    .padding(.bottom, 12)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

struct TagCloudView: View {
    var tags: [String]
    
    @State private var totalHeight
    = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func item(for text: String) -> some View {
        Text("# \(text)")
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 12)
            .font(.system(size: 14))
            .foregroundColor(Color.darkGray)
            .background(Color.modernGray)
            .cornerRadius(40)
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
