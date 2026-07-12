#!/usr/bin/env swift

import AppKit
import CoreText
import Foundation
import ImageIO
import UniformTypeIdentifiers

struct IconImage {
  let path: String
  let size: Int
}

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let iosIconDir = root.appendingPathComponent("ios/Runner/Assets.xcassets/AppIcon.appiconset")
let androidResDir = root.appendingPathComponent("android/app/src/main/res")
let brandDir = root.appendingPathComponent("assets/brand")

let iosIcons: [IconImage] = [
  .init(path: "Icon-App-20x20@1x.png", size: 20),
  .init(path: "Icon-App-20x20@2x.png", size: 40),
  .init(path: "Icon-App-20x20@3x.png", size: 60),
  .init(path: "Icon-App-29x29@1x.png", size: 29),
  .init(path: "Icon-App-29x29@2x.png", size: 58),
  .init(path: "Icon-App-29x29@3x.png", size: 87),
  .init(path: "Icon-App-40x40@1x.png", size: 40),
  .init(path: "Icon-App-40x40@2x.png", size: 80),
  .init(path: "Icon-App-40x40@3x.png", size: 120),
  .init(path: "Icon-App-60x60@2x.png", size: 120),
  .init(path: "Icon-App-60x60@3x.png", size: 180),
  .init(path: "Icon-App-76x76@1x.png", size: 76),
  .init(path: "Icon-App-76x76@2x.png", size: 152),
  .init(path: "Icon-App-83.5x83.5@2x.png", size: 167),
  .init(path: "Icon-App-1024x1024@1x.png", size: 1024),
]

let androidIcons: [IconImage] = [
  .init(path: "mipmap-mdpi/ic_launcher.png", size: 48),
  .init(path: "mipmap-hdpi/ic_launcher.png", size: 72),
  .init(path: "mipmap-xhdpi/ic_launcher.png", size: 96),
  .init(path: "mipmap-xxhdpi/ic_launcher.png", size: 144),
  .init(path: "mipmap-xxxhdpi/ic_launcher.png", size: 192),
]

func channel(_ value: UInt32, shift: UInt32) -> CGFloat {
  CGFloat((value >> shift) & 0xff) / 255.0
}

func cgColor(_ hex: UInt32) -> CGColor {
  CGColor(
    red: channel(hex, shift: 16),
    green: channel(hex, shift: 8),
    blue: channel(hex, shift: 0),
    alpha: 1
  )
}

func nsColor(_ hex: UInt32) -> NSColor {
  NSColor(cgColor: cgColor(hex)) ?? .black
}

@discardableResult
func registerFont(at url: URL) -> Bool {
  var error: Unmanaged<CFError>?
  return CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
}

func findBundledUnboundedFont() -> URL? {
  if let envPath = ProcessInfo.processInfo.environment["UNBOUNDED_FONT_PATH"], !envPath.isEmpty {
    return URL(fileURLWithPath: envPath)
  }

  let localFonts = [
    root.appendingPathComponent("assets/fonts"),
    root.appendingPathComponent("assets/brand/fonts"),
  ]

  for folder in localFonts where FileManager.default.fileExists(atPath: folder.path) {
    if let found = findFont(in: folder) {
      return found
    }
  }

  let simulatorFonts = FileManager.default.homeDirectoryForCurrentUser
    .appendingPathComponent("Library/Developer/CoreSimulator/Devices")
  return findFont(in: simulatorFonts)
}

func findFont(in folder: URL) -> URL? {
  guard let enumerator = FileManager.default.enumerator(
    at: folder,
    includingPropertiesForKeys: [.isRegularFileKey],
    options: [.skipsHiddenFiles, .skipsPackageDescendants]
  ) else {
    return nil
  }

  for case let file as URL in enumerator {
    let name = file.lastPathComponent.lowercased()
    guard name.hasSuffix(".ttf") || name.hasSuffix(".otf") else { continue }
    if name.contains("unbounded_800") || name.contains("unbounded-extra") || name.contains("unbounded") {
      return file
    }
  }

  return nil
}

func iconFont(size: CGFloat) -> NSFont {
  if NSFont(name: "Unbounded-ExtraBold", size: size) == nil,
     let font = findBundledUnboundedFont() {
    registerFont(at: font)
  }

  return NSFont(name: "Unbounded-ExtraBold", size: size)
    ?? NSFont(name: "AvenirNext-Heavy", size: size)
    ?? NSFont.systemFont(ofSize: size, weight: .heavy)
}

func writePNG(_ image: CGImage, to url: URL) throws {
  try FileManager.default.createDirectory(
    at: url.deletingLastPathComponent(),
    withIntermediateDirectories: true
  )

  guard let destination = CGImageDestinationCreateWithURL(
    url as CFURL,
    UTType.png.identifier as CFString,
    1,
    nil
  ) else {
    throw NSError(domain: "AppIcon", code: 1, userInfo: [NSLocalizedDescriptionKey: "Cannot create PNG destination"])
  }

  CGImageDestinationAddImage(destination, image, nil)
  if !CGImageDestinationFinalize(destination) {
    throw NSError(domain: "AppIcon", code: 2, userInfo: [NSLocalizedDescriptionKey: "Cannot write \(url.path)"])
  }
}

func renderIcon(size: Int) -> CGImage {
  let canvas = CGFloat(size)
  let scale = canvas / 1024.0
  let colorSpace = CGColorSpaceCreateDeviceRGB()

  guard let context = CGContext(
    data: nil,
    width: size,
    height: size,
    bitsPerComponent: 8,
    bytesPerRow: 0,
    space: colorSpace,
    bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
  ) else {
    fatalError("Cannot create bitmap context")
  }

  func s(_ value: CGFloat) -> CGFloat {
    value * scale
  }

  context.setFillColor(cgColor(0xF3EFE6))
  context.fill(CGRect(x: 0, y: 0, width: canvas, height: canvas))

  let nsContext = NSGraphicsContext(cgContext: context, flipped: false)
  NSGraphicsContext.saveGraphicsState()
  NSGraphicsContext.current = nsContext

  let font = iconFont(size: s(260))
  let letterSpacing = font.pointSize * (0.5 / 17.0)

  let wordAttributes: [NSAttributedString.Key: Any] = [
    .font: font,
    .foregroundColor: nsColor(0x18160F),
    .kern: letterSpacing,
  ]
  let dotAttributes: [NSAttributedString.Key: Any] = [
    .font: font,
    .foregroundColor: nsColor(0x2A39DE),
  ]

  let word = NSString(string: "QUIZ")
  let dot = NSString(string: ".")
  let wordSize = word.size(withAttributes: wordAttributes)
  let dotSize = dot.size(withAttributes: dotAttributes)
  let totalWidth = wordSize.width + dotSize.width * 0.78
  let wordX = (canvas - totalWidth) / 2
  let wordY = (canvas - wordSize.height) / 2 + s(44)

  word.draw(at: NSPoint(x: wordX, y: wordY), withAttributes: wordAttributes)
  dot.draw(at: NSPoint(x: wordX + wordSize.width - s(4), y: wordY), withAttributes: dotAttributes)

  context.setStrokeColor(cgColor(0x18160F))
  context.setLineWidth(s(8))
  context.move(to: CGPoint(x: s(200), y: s(388)))
  context.addLine(to: CGPoint(x: s(824), y: s(388)))
  context.strokePath()

  context.setStrokeColor(cgColor(0xD7D0C1))
  context.setLineWidth(s(6))
  context.move(to: CGPoint(x: s(260), y: s(342)))
  context.addLine(to: CGPoint(x: s(764), y: s(342)))
  context.strokePath()

  NSGraphicsContext.restoreGraphicsState()

  guard let image = context.makeImage() else {
    fatalError("Cannot create image")
  }

  return image
}

do {
  try writePNG(renderIcon(size: 1024), to: brandDir.appendingPathComponent("app_icon_1024.png"))

  for icon in iosIcons {
    try writePNG(renderIcon(size: icon.size), to: iosIconDir.appendingPathComponent(icon.path))
  }

  for icon in androidIcons {
    try writePNG(renderIcon(size: icon.size), to: androidResDir.appendingPathComponent(icon.path))
  }

  print("Generated \(iosIcons.count + androidIcons.count + 1) app icon PNGs")
} catch {
  fputs("Failed to generate app icons: \(error)\n", stderr)
  exit(1)
}
