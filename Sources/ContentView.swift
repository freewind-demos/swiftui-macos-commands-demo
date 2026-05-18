import SwiftUI

extension Notification.Name {
    static let demoCommandIncrement = Notification.Name("demoCommandIncrement")
    static let demoCommandReset = Notification.Name("demoCommandReset")
}

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("当前计数：\(count)")
                .font(.largeTitle)
            Text("试试菜单栏 Demo Commands，或快捷键 ⌘= / ⇧⌘0。")
                .foregroundStyle(.secondary)
        }
        .padding()
        .onReceive(NotificationCenter.default.publisher(for: .demoCommandIncrement)) { _ in
            count += 1
        }
        .onReceive(NotificationCenter.default.publisher(for: .demoCommandReset)) { _ in
            count = 0
        }
    }
}

struct DemoCommands: Commands {
    var body: some Commands {
        CommandMenu("Demo Commands") {
            Button("加 1") {
                NotificationCenter.default.post(name: .demoCommandIncrement, object: nil)
            }
            .keyboardShortcut("=", modifiers: .command)

            Button("归零") {
                NotificationCenter.default.post(name: .demoCommandReset, object: nil)
            }
            .keyboardShortcut("0", modifiers: [.command, .shift])
        }
    }
}
