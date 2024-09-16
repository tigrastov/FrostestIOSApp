

import SwiftUI
let screen = UIScreen.main.bounds
@main
struct FrostestApp: App {
    var body: some Scene {
        WindowGroup {
                DetailRefView(listVM: RefregirantListViewModel())
        }
    }
}
