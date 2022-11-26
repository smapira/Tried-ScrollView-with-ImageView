import UIKit

var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {

  private var lastURLUsedToLoadImage: String?

  func loadImage(urlString: String) {
    lastURLUsedToLoadImage = urlString
    image = nil

    if let cachedImage = imageCache[urlString] {
      image = cachedImage
      return
    }

    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) {
      (
        data,
        response,
        err
      ) in
      if let err = err {
        print(
          "Failed to fetch image:",
          err)
        return
      }

      if url.absoluteString != self.lastURLUsedToLoadImage { return }

      guard let imageData = data else { return }
      guard let photoImage = UIImage(data: imageData) else { return }

      DispatchQueue.main.async {
        imageCache[url.absoluteString] = photoImage
        self.image = photoImage
      }
    }.resume()
  }
}
