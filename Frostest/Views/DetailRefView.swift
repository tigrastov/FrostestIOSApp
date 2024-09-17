
import SwiftUI
struct DetailRefView: View {
    
    @StateObject var listVM: RefregirantListViewModel
    @State private var selectIndex = 0
    @State private var isDew = false
    
    var body: some View {
        VStack{
            ZStack{
                if !isDew{
                    Image("DescriptionBG").frame(width: screen.width * 0.88, height: screen.height * 0.35).clipShape(.rect(cornerRadius: 25))
                        .transition(.flip)
                }else{
                    Image("description2").frame(width: screen.width * 0.88, height: screen.height * 0.35).clipShape(.rect(cornerRadius: 25))
                        .transition(.reversedFlip)
                }
                
                HStack{
                    if listVM.refregirants[listVM.currentRefIndex].name == "R-410a" || listVM.refregirants[listVM.currentRefIndex].name == "R-404a" || listVM.refregirants[listVM.currentRefIndex].name == "R-407c"{
                        
                        VStack{
                            
                            Image(isDew ? "dew": "bubble")
                            
                            Text(isDew ? "Dew": "Bubble" ).foregroundStyle(isDew ? Color.black : Color.white)
                            
                            Toggle("", isOn: $isDew).offset(x: -45)
                                
                        }.padding(5)
                            .frame(width: screen.width * 0.37, height: screen.height * 0.3)
                            .background(GlassView(removeEffects: false).clipShape(.rect(cornerRadius: 25)))
                            .onTapGesture {
                            withAnimation(.bouncy(duration: 1)) {
                            isDew.toggle()
                            }
                            }
                        
                    }
                    VStack{
                        ZStack{
                            Image (listVM.refregirants[listVM.currentRefIndex].image)
                            
                            Text(listVM.refregirants[listVM.currentRefIndex].name).foregroundStyle(
                                
                                listVM.refregirants[listVM.currentRefIndex].name == "R-12" || listVM.refregirants[listVM.currentRefIndex].name == "R-600a"  ? Color.black : Color.white
                            ).font(.system(size: 20)).fontWeight(.bold).offset(x: -5, y: 12)
                        }
                        Text(listVM.refregirants[listVM.currentRefIndex].desription).foregroundStyle(isDew ? Color.black : Color.white).font(.system(size: 12))
                    }.padding(10)
                        .frame(width: screen.width * 0.37, height: screen.height * 0.3)
                        .background(GlassView(removeEffects: false).clipShape(.rect(cornerRadius: 25)))
                }
            }.padding(8)
            
            if !isDew{
                HStack{
                    Image("temp")
                        .overlay{
                            Text("\(Array(listVM.refregirants[listVM.currentRefIndex].ratio.keys.sorted())[selectIndex])").foregroundStyle((Array(listVM.refregirants[listVM.currentRefIndex].ratio.keys.sorted())[selectIndex]) <= 0 ? Color.blue : Color.red).font(.system(size: 22)).fontWeight(.bold)
                        }
                    Spacer()
                    Image("pressure")
                        .overlay{
                            Text("\(Array(listVM.refregirants[listVM.currentRefIndex].ratio.values.sorted())[selectIndex])").foregroundStyle(Color.white).font(.system(size: 22)).fontWeight(.bold)
                        }
                }
                .padding()
            }else{
                HStack{
                    Image("temp")
                        .overlay{
                            Text("\(Array(listVM.refregirants[listVM.currentRefIndex].ratioOpt!.keys.sorted())[selectIndex])").foregroundStyle((Array(listVM.refregirants[listVM.currentRefIndex].ratioOpt!.keys.sorted())[selectIndex]) <= 0 ? Color.blue : Color.red).font(.system(size: 22)).fontWeight(.bold)
                        }
                    Spacer()
                    Image("pressure")
                        .overlay{
                            Text("\(Array(listVM.refregirants[listVM.currentRefIndex].ratioOpt!.values.sorted())[selectIndex])").foregroundStyle(Color.white).font(.system(size: 22)).fontWeight(.bold)
                        }
                }
                .padding()
            }
    
            if !isDew{
                
                Slider(value: Binding(get: {Double(selectIndex)},
                                      set: { newValue in
                    selectIndex = Int(newValue)
                }),
                       in:  0...Double(Array(listVM.refregirants[listVM.currentRefIndex].ratio.keys.sorted()).count - 1), step: 1
                )
                .accentColor((Array(listVM.refregirants[listVM.currentRefIndex].ratio.keys.sorted())[selectIndex]) <= 0 ? Color.blue : Color.red)
                .padding()
                .offset(y: -20)
                
            }else{
                
                Slider(value: Binding(get: {Double(selectIndex)},
                                      set: { newValue in
                    selectIndex = Int(newValue)
                }),
                       in:  0...Double(Array(listVM.refregirants[listVM.currentRefIndex].ratioOpt!.keys.sorted()).count - 1), step: 1
                )
                .accentColor((Array(listVM.refregirants[listVM.currentRefIndex].ratioOpt!.keys.sorted())[selectIndex]) <= 0 ? Color.blue : Color.red)
                .padding()
                .offset(y: -20)
            }
            
            CustomPickerView()
                .padding(.top)
        }.frame(width: screen.width, height: screen.height).background(Color.black)
    }
}
