import SwiftUI
import Foundation

struct WordDetailView: View {
    var namespace: Namespace.ID
    var wrapper: FavouriteWord
    @State var saved: Bool = false
    @State var isPlaying = false
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            ScrollView {
                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: screen.height/3)
                .padding(20)
                .foregroundColor(Color.black)
                .background(
                    
                    ZStack {
                        Colors.Palette.mediumTurquoise.color
                        
                        HStack {
                            Spacer()
                            bookmark
                            close
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(20)
                        
                        .padding(.top, 20)
                    }
                        .matchedGeometryEffect(id: "background", in: namespace)
                    
                )
                .mask{
                    RoundedRectangle(cornerRadius: 10.0)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                }
                .overlay (
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            Text(wrapper.word.word_)
                                .font(.title)
                                .matchedGeometryEffect(id: "word", in: namespace)
                            
                            Text(wrapper.word.phonetic_)
                            
                            Spacer()
                            WatermarkView(character: wrapper.word.word?.first?.uppercased() ?? "W", color: Colors.Palette.floralWhite.color)
                                .matchedGeometryEffect(id: "watermark", in: namespace)
                        }
                        .matchedGeometryEffect(id: "info", in: namespace)
                        
                        Text(wrapper.word.meanings?.first?.definitions?.first?.definition ?? "")
                            .font(.callout)
                            .matchedGeometryEffect(id: "definition", in: namespace)
                    }
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask (RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .matchedGeometryEffect(id: "blur", in: namespace)
                        )
                        .offset(y: 150)
                        .padding(20)
                )
                .ignoresSafeArea()
            }
            .frame(height: screen.height)
    }
    
    var bookmark: some View {
        Image(systemName: saved ? "bookmark.fill" : "bookmark")
            .font(.body.weight(.bold))
            .foregroundColor(.secondary)
            .padding(8)
            .background(.ultraThinMaterial, in: Circle())
            .onTapGesture {
                saved.toggle()
                if saved {
                    viewModel.addToFavorite(word: wrapper.word)
                } else {
                    viewModel.removeFromFavorite(word: wrapper.word)
                }
            }
            .onAppear {
                saved = viewModel.favoriteWords.contains(where: {$0.word.word_ == wrapper.word.word_ })
            }
    }
    
    var close: some View {
        Image(systemName: "xmark")
            .font(.body.weight(.bold))
            .foregroundColor(.secondary)
            .padding(8)
            .background(.ultraThinMaterial, in: Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    wrapper.show = false
                }
            }
    }
}

struct WordDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        WordDetailView(namespace: namespace, wrapper: FavouriteWord(word: Model.word, show: false, appear: false))
            .environmentObject(Model.viewModel)
    }
}

