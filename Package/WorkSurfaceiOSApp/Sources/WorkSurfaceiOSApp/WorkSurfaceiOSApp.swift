import SwiftUI

/// WorkSurfaceiOSApp パッケージのサンプルView
@MainActor
public struct WorkSurfaceWelcomeView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "app.badge.checkmark.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)

            Text("WorkSurfaceiOSApp")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("iOS専用パッケージが正常に読み込まれました")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    WorkSurfaceWelcomeView()
}
