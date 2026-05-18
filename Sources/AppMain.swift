import SwiftUI

@main
struct SwiftUICommandsDemoApp: App {
    var body: some Scene {
        Window("Commands 演示", id: "main") {
            ContentView()
        }
        .defaultSize(width: 520, height: 320)
        .commands {
            DemoCommands()
        }
    }
}
