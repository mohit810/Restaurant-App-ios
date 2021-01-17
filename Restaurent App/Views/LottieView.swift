//
//  LottieView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 17/01/21.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationName: String?
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        if let anim = animationName {
            let animationView = AnimationView()
            let animation = Animation.named(anim)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.play()
            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
