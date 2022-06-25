//
//  OCRView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct OCRView: View {
    @ObservedObject var viewModel = CameraViewModel()
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear {
                    viewModel.configure()
                }
            
            VStack {
                Spacer()
                
                HStack{
                    // 찍은 사진 미리보기, 일단 액션 X
//                    Button(action: {}) {
//                        // ✅ view 추가
//                        if let previewImage = viewModel.recentImage {
//                            Image(uiImage: previewImage)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 75, height: 75)
//                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                .aspectRatio(1, contentMode: .fit)
//                        } else {
//                            // ✅ linewidth 살짝 수정
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(lineWidth: 3)
//                                .foregroundColor(.white)
//                                .frame(width: 75, height: 75)
//                        }
//                    }
//                    .padding()
                    
                    Spacer()
                    
                    // 사진찍기 버튼
                    Button(action: {
                        viewModel.capturePhoto()
                        self.isPressed = true
                    }) {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                    }
                    .background(
                        NavigationLink(isActive: self.$isPressed, destination: {
                            if let previewImage = viewModel.recentImage {
                                VStack {
                                    Image(uiImage: previewImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width)
                                        
                                    Spacer()
                                }
                                .navigationBarTitleDisplayMode(.inline)
                            }
                        }, label: { EmptyView() })
                    )
                    
                    Spacer()
                    
                    // 전후면 카메라 교체
//                    Button(action: {viewModel.changeCamera()}) {
//                        Image(systemName: "arrow.triangle.2.circlepath.camera")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 50, height: 50)
//                        
//                    }
//                    .frame(width: 75, height: 75)
//                    .padding()
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct OCRView_Previews: PreviewProvider {
    static var previews: some View {
        OCRView()
    }
}
