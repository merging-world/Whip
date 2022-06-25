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
    @Binding var isOnOCRView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                viewModel.cameraPreview
                    .onAppear {
                        viewModel.configure()
                    }
                
                VStack {
                    Divider()
                        .padding(.horizontal, 17)
                        .padding(.top, 40)
                    
                    HStack{
                        Spacer()
                        // 사진찍기 버튼
                        Button(action: {
                            viewModel.capturePhoto()
                            self.isPressed = true
                        }) {
                            VStack {
                                Circle()
                                    .stroke(lineWidth: 5)
                                    .fill(Color.carrot)
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    .shadow(color: Color(red: 40/255, green: 67/255, blue: 135/255).opacity(0.25), radius: 10, x: 0, y: 4)
                                
                                Text("촬영")
                                    .font(.system(size: 16))
                                    .foregroundColor(.carrot)
                            }
                        }
                        .background(
                            NavigationLink(isActive: self.$isPressed, destination: {
                                if let previewImage = viewModel.recentImage {
                                    VStack {
                                        Image(uiImage: previewImage)
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                                        
                                        Spacer()
                                        Text(self.resultText)
                                            .foregroundColor(.fontColor)
                                            .onAppear {
                                                getText(image: previewImage)
                                            }
                                        Spacer()
                                    }
                                    .navigationBarTitleDisplayMode(.inline)
                                }
                            }, label: { EmptyView() })
                        )
                        Spacer()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("닫기") {
                        self.isOnOCRView = false
                    }
                }
            }
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
        default :
            return .up
        }
    }
}

struct OCRView_Previews: PreviewProvider {
    static var previews: some View {
        OCRView(isOnOCRView: .constant(true))
    }
}
