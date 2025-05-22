import UIKit

public final class HapticManager {
    public static let shared = HapticManager()
    private let generator = UINotificationFeedbackGenerator()

    private init() {
        generator.prepare()
    }

    public func notifySuccess() {
        generator.notificationOccurred(.success)
    }
}
