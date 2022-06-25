//
//  NavigationBarColor.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

import SwiftUI
import UIKit

extension UINavigationController : UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK :  Navigation Stack에 쌓인 뷰가 1개를 초과해야 제스처가 동작 하도록
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
