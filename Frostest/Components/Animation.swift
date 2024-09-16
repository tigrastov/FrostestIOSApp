
import SwiftUI
import Foundation
struct FlipTransition: ViewModifier, Animatable{
    
    var progress: CGFloat = 0
    var animatableData: CGFloat{
        get{progress}
        set{progress = newValue}
    }
    func body(content: Content) -> some View {
        content
            .opacity(progress < 0 ? (-progress < 0.5 ? 1 : 0) : (progress < 0.5 ? 1 : 0))
        .rotation3DEffect(
            .degrees(progress * 180),
                                  axis: (x: 1.0, y: 0.2, z: 0.3)
        )
    }
}
extension AnyTransition{
    static let flip: AnyTransition = .modifier(active: FlipTransition(progress: -1), identity: FlipTransition())
    
    static let reversedFlip: AnyTransition = .modifier(active: FlipTransition(progress: 1), identity: FlipTransition() )
}
