

import SwiftUI
let screen = UIScreen.main.bounds
@main
struct FrostestApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            
            if isLoading {
                LoadingView(isLoading: $isLoading)
            }else {
                DetailRefView(listVM: RefregirantListViewModel())
            }
            
            
            
            
                
        }
    }
}
