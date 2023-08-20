//
//  VoiceMemo.swift
//  test
//
//  Created by shatha on 20/01/1445 AH.
//
import SwiftUI
import AVFoundation
import CoreData

struct VoiceMemo: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var audioRecorder: AVAudioRecorder!
    @State private var isPlaying: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var recordingCount: Int = 0
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
        } catch {
            print("Recording failed")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        audioRecorder = nil
        
        saveAudioDataToCoreData()
        recordingCount += 1
    }
    
    func playRecording(audioData: Data, index: Int) {
        do {
            audioPlayer = try AVAudioPlayer(data: audioData)
            audioPlayer?.play()
            isPlaying = true
            DispatchQueue.main.asyncAfter(deadline: .now() + audioPlayer!.duration) {
                isPlaying = false
            }
        } catch {
            print("Playback failed")
        }
    }
    


    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveAudioDataToCoreData() {
        let newAudio = AudioEntity(context: viewContext)
        
        if let audioData = FileManager.default.contents(atPath: getDocumentsDirectory().appendingPathComponent("recording.m4a").path) {
            newAudio.audioData = audioData
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to save audio data to Core Data: \(error)")
        }
    }
    
    func fetchAudioEntities() -> [AudioEntity] {
        var audioEntities = [AudioEntity]()
        
        let fetchRequest: NSFetchRequest<AudioEntity> = AudioEntity.fetchRequest()
        
        do {
            audioEntities = try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch audio entities: \(error)")
        }
        
        return audioEntities
    }
    
    var body: some View {
        Text("  Talk about any thing").font(.title3.bold()).frame(maxWidth: .infinity, alignment: .leading)
        Text("   for eg (your day)").foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading)

        VStack {
           

         
     
                List(fetchAudioEntities(), id: \.self) { audioEntity in
                    let index = fetchAudioEntities().firstIndex(of: audioEntity)!
                    let isCurrentlyPlaying = isPlaying && index == recordingCount
                    
                    Text("Audio Recording \(index)")
                        .onTapGesture {
                            if let audioData = audioEntity.audioData {
                                if isCurrentlyPlaying {
                                    audioPlayer?.stop()
                                    isPlaying = false
                                } else {
                                    playRecording(audioData: audioData, index: index)
                                }
                            }
                        }
                        .foregroundColor(isCurrentlyPlaying ? .red : .primary)
                }.listStyle(PlainListStyle())
                    .background(Color.white)
                    .padding(.top)
                
                
                Spacer() // Add a spacer to push the button to the bottom
                
                Button(action: {
                    if audioRecorder == nil {
                        startRecording()
                    } else {
                        stopRecording()
                    }
                }) {
                    Image(systemName: audioRecorder == nil ? "mic.fill" : "stop.circle.fill")
                }
                .buttonStyle(MyButtonStyle())
                .padding(.bottom)
            }
        
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let gradient = LinearGradient(
                  gradient: Gradient(colors: [Color("Color4"), Color("Color5")]), // Replace with your color set names
                  startPoint: .bottomLeading,
                  endPoint: .topTrailing)
        configuration.label
            .font(.system(size: 30))
            .padding()
            .background(gradient)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct VoiceMemo_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMemo()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
