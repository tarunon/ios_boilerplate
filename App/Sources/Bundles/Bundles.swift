import Foundation

class Bundles {
  static var module: Bundle = {
    let bundleName = "App_Bundles"

    let candidates = [
      // Bundle should be present here when the package is linked into an App.
      Bundle.main.resourceURL,

      // Bundle should be present here when the package is linked into a framework.
      Bundle(for: Bundles.self).resourceURL,

      // For command-line tools.
      Bundle.main.bundleURL,
    ]

    for candidate in candidates {
      let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
      if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
        return bundle
      }
    }
    return Bundle(for: Bundles.self)
  }()
}
