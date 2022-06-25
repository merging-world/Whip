//
//  ChallengeSuccessView.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

import SwiftUI

struct ChallengeSuccessView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(spacing: 16) {
            Image("Trophy")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
            Text("챌린지 달성")
                .font(.system(size: 32))
                .fontWeight(.bold)
            Text("당근 지수 15 획득")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.carrot)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("돌아가기")
                    .bold()
            }
            .buttonStyle(
                BigButtonStyle(
                    fontSize: 20,
                    fontColor: .white,
                    backgroundColor: Color.carrot
                )
            )
            .padding(.horizontal, 24)
            .padding(.vertical, 40)
        }
        .navigationBarHidden(true)
    }
}

struct ChallengeSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeSuccessView()
    }
}
