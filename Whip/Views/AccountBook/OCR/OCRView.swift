//
//  OCRView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI
import MLKitTextRecognitionKorean
import MLKitVision
import AVFoundation

struct OCRView: View {
    @ObservedObject var viewModel = CameraViewModel()
    @State var isPressed = false
    @State var resultText = ""
    
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
//                                    Image(uiImage: previewImage)
//                                        .resizable()
//                                        .scaledToFit()
////                                        .frame(width: UIScreen.main.bounds.width)
//                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)
                                    
                                    Text(self.resultText)
                                        .foregroundColor(.fontColor)
                                        .onAppear {
                                            getText(image: previewImage)
                                        }
                                        
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

extension OCRView {
    func getText(image: UIImage) {
        let koreanOptions = KoreanTextRecognizerOptions()
        let textRecognizer = TextRecognizer.textRecognizer(options: koreanOptions)
        let visionImage = VisionImage(image: image)
        visionImage.orientation = imageOrientation(deviceOrientation: UIDevice.current.orientation, cameraPosition: .back)
        
        textRecognizer.process(visionImage) { result, error in
            guard error == nil, let result = result else {
                //error handling
                return
            }
            //결과값 출력
            self.resultText = result.text
        }
    }
    func imageOrientation(
        deviceOrientation: UIDeviceOrientation,
        cameraPosition: AVCaptureDevice.Position
    ) -> UIImage.Orientation {
        switch deviceOrientation {
        case .portrait:
            return cameraPosition == .front ? .leftMirrored : .right
        case .landscapeLeft:
            return cameraPosition == .front ? .downMirrored : .up
        case .portraitUpsideDown:
            return cameraPosition == .front ? .rightMirrored : .left
        case .landscapeRight:
            return cameraPosition == .front ? .upMirrored : .down
        case .faceDown, .faceUp, .unknown:
            return .up
        }
    }
}

struct OCRView_Previews: PreviewProvider {
    static var previews: some View {
        OCRView()
    }
}
