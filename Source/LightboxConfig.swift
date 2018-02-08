import UIKit
import AVKit
import AVFoundation

public class LightboxConfig {
  /// Whether to show status bar while Lightbox is presented
  public static var hideStatusBar = true

  /// Provide a closure to handle selected video
  public static var handleVideo: (_ from: UIViewController, _ videoURL: URL) -> Void = { from, videoURL in
    let videoController = AVPlayerViewController()
    videoController.player = AVPlayer(url: videoURL)

    from.present(videoController, animated: true) {
      videoController.player?.play()
    }
  }

  /// How to load image onto UIImageView
  public static var loadImage: (UIImageView, URL, ((UIImage?) -> Void)?) -> Void = { (imageView, imageURL, completion) in
    completion?(nil)
  }

  /// Indicator is used to show while image is being fetched
  public static var makeLoadingIndicator: () -> UIView = {
    let indicator = LoadingIndicator()
    indicator.indicator.color = IndicatorLoading.color
    indicator.backgroundColor = IndicatorLoading.backgroundColor
    return indicator
  }

  public struct PageIndicator {
    public static var enabled = true
    public static var separatorColor = UIColor(red: 61/255.0, green: 71/255.0, blue: 87/255.0, alpha: 1.0)

    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.systemFont(ofSize: 12),
      .foregroundColor: UIColor(red: 137/255.0, green: 154/255.0, blue: 184/255.0, alpha: 1.0),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct CloseButton {
    public static var enabled = true
    public static var size: CGSize?
    public static var text = NSLocalizedString("Close", comment: "")
    public static var image: UIImage?

    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: 16),
      .foregroundColor: UIColor.white,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct DeleteButton {
    public static var enabled = false
    public static var size: CGSize?
    public static var text = NSLocalizedString("Delete", comment: "")
    public static var image: UIImage?

    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: 16),
      .foregroundColor: UIColor(red: 250/255.0, green: 47/255.0, blue: 91/255.0, alpha: 1.0),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct InfoLabel {
    public static var enabled = true
    public static var textColor = UIColor.white
    public static var ellipsisText = NSLocalizedString("Show more", comment: "")
    public static var ellipsisColor = UIColor(red: 137/255.0, green: 154/255.0, blue: 185/255.0, alpha: 1.0)

    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.systemFont(ofSize: 12),
      .foregroundColor: UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
    ]
  }

  public struct Zoom {
    public static var minimumScale: CGFloat = 1.0
    public static var maximumScale: CGFloat = 3.0
  }
    
  public struct IndicatorLoading {
    public static var backgroundColor: UIColor = .darkGray
    public static var color: UIColor = .white
  }
}
