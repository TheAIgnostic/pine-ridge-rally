import Cocoa
import WebKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
let delegate = AppDelegate()
app.delegate = delegate

let window = NSWindow(
    contentRect: NSRect(x: 0, y: 0, width: 1280, height: 800),
    styleMask: [.titled, .closable, .miniaturizable, .resizable],
    backing: .buffered, defer: false
)
window.title = "Pine Ridge Rally"
window.minSize = NSSize(width: 800, height: 500)
window.center()

let config = WKWebViewConfiguration()
let webView = WKWebView(frame: window.contentView!.bounds, configuration: config)
webView.autoresizingMask = [.width, .height]
window.contentView!.addSubview(webView)

guard let htmlURL = Bundle.main.url(forResource: "index", withExtension: "html") else {
    fatalError("index.html missing from app bundle")
}
webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())

// minimal menu bar so Cmd+Q / Cmd+M / Cmd+W work
let mainMenu = NSMenu()
let appMenuItem = NSMenuItem()
mainMenu.addItem(appMenuItem)
let appMenu = NSMenu()
appMenu.addItem(NSMenuItem(title: "Quit Pine Ridge Rally",
                           action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
appMenuItem.submenu = appMenu
let windowMenuItem = NSMenuItem()
mainMenu.addItem(windowMenuItem)
let windowMenu = NSMenu(title: "Window")
windowMenu.addItem(NSMenuItem(title: "Minimize",
                              action: #selector(NSWindow.performMiniaturize(_:)), keyEquivalent: "m"))
windowMenu.addItem(NSMenuItem(title: "Close",
                              action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"))
windowMenuItem.submenu = windowMenu
app.mainMenu = mainMenu
app.windowsMenu = windowMenu

window.makeKeyAndOrderFront(nil)
app.activate(ignoringOtherApps: true)
app.run()
