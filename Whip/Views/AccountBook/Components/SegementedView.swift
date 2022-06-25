//
//  SegementedView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct SegementedView: View {
    @Binding var selectedMode: AccountBookViewMode {
        didSet {
            self.selectedIndex = self.selectedMode.index
        }
    }
    @State private var selectedIndex = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 3)
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(AccountBookViewMode.allCases, id: \.self) { mode in
                        Button(action: {
                            withAnimation {
                                self.selectedMode = mode
                            }
                        }) {
                            Group {
                                if self.selectedMode == mode {
                                    Text(mode.rawValue)
                                        .bold()
                                        .foregroundColor(.white)
                                } else {
                                    Text(mode.rawValue)
                                        .foregroundColor(.fontColor)
                                }
                            }
                            .font(.system(size: 13))
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                        }
                        .onTapGesture {
                            withAnimation {
                                self.selectedMode = mode
                            }
                        }
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        self.setFrame(
                                            index: mode.index,
                                            frame: geo.frame(in: .global)
                                        )
                                    }
                            }
                        )
                    }
                }
                .background(
                    Capsule()
                        .fill(Color.carrot)
                        .frame(
                            width: self.frames[self.selectedIndex].width,
                            height: self.frames[self.selectedIndex].height,
                            alignment: .topLeading
                        )
                        .offset(
                            x: self.frames[self.selectedIndex].minX - self.frames[0].minX
                        ),
                    alignment: .leading
                )
                .background(
                    Capsule()
                        .fill(Color.card)
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 14,
                            x: 0,
                            y: 0
                        )
                )
            }
        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}

struct SegementedView_Previews: PreviewProvider {
    static var previews: some View {
        SegementedView(selectedMode: .constant(.daily))
    }
}
