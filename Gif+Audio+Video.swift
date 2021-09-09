//
//  Gif+Audio+Video.swift
//  PizzaDough
//
//  Created by Omer on 7/24/21.
//

import SwiftUI
import AVKit

struct AudioguidePlayer: View {
    @State var name: String
    @State var time: CGFloat = 0
    @State var player: AVAudioPlayer!
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(name).bold().foregroundColor(.black)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray).frame(height: 8)
                    .padding(10)
                Capsule()
                    .fill(backgRed).frame(width: time, height: 8)
                    .padding(10)
                    .gesture(DragGesture()
                                .onChanged { value in
                                    let x = value.location.x
                                    self.time = x
                                }
                                .onEnded { value in
                                    let x = value.location.x
                                    let screen = UIScreen.main.bounds.width - 30
                                    let percent = x / screen
                                    player.currentTime = Double(percent) * player.duration
                                }
                    )
            }
            
            HStack(spacing: 30) {
                Button(action: { backward10() }) {
                    Image(systemName: "gobackward.10").imageScale(.large)
                }
                Button(action: {
                    if !isPlaying {
                        startPlay()
                    } else {
                        pausePlay()
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill").imageScale(.large)
                }
                Button(action: { forward10() }) {
                    Image(systemName: "goforward.10").imageScale(.large)
                }
            }
            .foregroundColor(.black)
        }
        .onAppear() {
            loadUrl()
        }
        .onDisappear() {
            player.pause()
        }
    }
    func loadUrl() {
        let url = Bundle.main.path(forResource: name, ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
    }
    func startPlay() {
        player.play()
        isPlaying.toggle()
        DispatchQueue.global(qos: .background).async {
            while true {
                let screenWidth = UIScreen.main.bounds.width - 20
                let currentTime = player.currentTime / player.duration
                let timeForLabel = CGFloat(currentTime) * screenWidth
                time = timeForLabel
            }
        }
    }
    func pausePlay() {
        player.pause()
        isPlaying.toggle()
    }
    func endPlay() {
        player.stop()
        isPlaying.toggle()
    }
    func forward10() {
        let increase = player.currentTime + 10
        if increase < player.duration {
            player.currentTime = increase
        }
    }
    func backward10() {
        player.currentTime -= 10
    }
}


















//
//struct GifView: UIViewRepresentable {
//    let animatedView = FLAnimatedImageView()
//    var fileName: String
//    func makeUIView(context: UIViewRepresentableContext<GifView>) -> UIView {
//        let view = UIView()
//
//        let path: String = Bundle.main.path(forResource: fileName, ofType: "gif")!
//        let url = URL(fileURLWithPath: path)
//        let gifData = try! Data(contentsOf: url)
//
//        let gif = FLAnimatedImage(animatedGIFData: gifData)
//        animatedView.animatedImage = gif
//
//        animatedView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animatedView)
//
//        NSLayoutConstraint.activate([
//            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifView>) {
//    }
//}

