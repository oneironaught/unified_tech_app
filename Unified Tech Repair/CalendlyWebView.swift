import SwiftUI
import WebKit

struct CalendlyWebView: UIViewRepresentable {
    let urlString: String

    // Create the WKWebView instance
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    // Load the URL in the WKWebView
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

// SwiftUI Preview
struct CalendlyWebView_Previews: PreviewProvider {
    static var previews: some View {
        CalendlyWebView(urlString: "https://calendly.com/unifiedtechrepairs/30min")
    }
}
