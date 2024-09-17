

import SwiftUI

struct CustomPickerView: View {
    @State var viewModel = RefregirantListViewModel()
    @State var isShowDetaiView = false
    let layout = [GridItem(.adaptive(minimum: screen.width / 1.5))]
    
    var body: some View {
        
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    ForEach(viewModel.refregirants){ item in
                        
                        GeometryReader { geometry in
                            ZStack{
                                Image(item.image)
                                Text(item.name).foregroundStyle(item.name == "R-12" || item.name == "R-600a" ? Color.black : Color.white).font(.system(size: 20)).fontWeight(.bold).offset(x: -5, y: 12)
                            }
                            .onTapGesture {
                                isShowDetaiView.toggle()
                                viewModel.currentRefIndex = viewModel.refregirants.firstIndex(where: { r in
                                    r.id == item.id
                                })!
                            }
                            .rotation3DEffect(
                                Angle(degrees: Double(geometry.frame(in: .global).minX - 90) / -5),
                                axis: (x: 10.0, y: 10.0, z: 100.0)
                            )
                            .animation(.easeInOut(duration: 0.3), value: geometry.frame(in: .global).minX)
                        }
                        .frame(width: 60, height: 100)
                        
                    }
                }
            }
            
            .fullScreenCover(isPresented: $isShowDetaiView, content: {
                DetailRefView(listVM: viewModel)
            })
            
        }
        
    }
}

#Preview {
    CustomPickerView()
}
