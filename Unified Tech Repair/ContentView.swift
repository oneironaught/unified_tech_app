import SwiftUI
import WebKit

// Define a service model for the list of services
struct Service: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let calendlyLink: String
}

struct ContentView: View {
    // State to track if the user is on the main page or the service page
    @State private var isOnMainPage: Bool = true

    let services: [Service] = [
        Service(
            name: "iPhone Screen Replacement",
            description: "Fast and reliable iPhone screen repair.",
            calendlyLink: "https://calendly.com/YOUR-CALENDLY-USERNAME/screen-replacement"
        ),
        Service(
            name: "Battery Replacement",
            description: "Replace your iPhone or MacBook battery.",
            calendlyLink: "https://calendly.com/YOUR-CALENDLY-USERNAME/battery-replacement"
        ),
        Service(
            name: "MacBook Repair",
            description: "Expert repairs for MacBook hardware and software.",
            calendlyLink: "https://calendly.com/YOUR-CALENDLY-USERNAME/macbook-repair"
        ),
        Service(
            name: "Website Design",
            description: "Professional website design services.",
            calendlyLink: "https://calendly.com/YOUR-CALENDLY-USERNAME/website-design"
        ),
        Service(
            name: "Other Repairs",
            description: "Custom solutions for other repair needs.",
            calendlyLink: "https://calendly.com/unifiedtechrepairs/30min"
        )
    ]

    var body: some View {
        NavigationView {
            if isOnMainPage {
                // Main Page
                VStack {
                    // Logo
                    Image("my_logo") // Replace with your actual logo's image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom)

                    Text("Welcome to Unified Tech Repair")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()

                    Text("Fast, reliable, and professional repair services for your devices.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding()

                    // "Book a Service" button
                                   Button(action: {
                                       isOnMainPage = false
                                   }) {
                                       Text("Book a Service")
                                           .font(.headline)
                                           .foregroundColor(.white)
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color.blue)
                                           .cornerRadius(10)
                                           .padding(.horizontal)
                                   }

                    // "Schedule Free Consultation" button
                    NavigationLink(destination: CalendlyWebView(urlString: "https://calendly.com/unifiedtechrepairs/30min")) {
                        Text("Schedule Free Consultation")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                    .padding()
            } else {
                // Book a Service Page
                VStack {
                    Text("Book a Service")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    Text("Unified Tech Repair")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom)

                    Text("Choose a service to book an appointment:")
                        .font(.subheadline)
                        .padding(.bottom)

                    List(services) { service in
                        NavigationLink(destination: CalendlyWebView(urlString: service.calendlyLink)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(service.name)
                                        .font(.headline)
                                    Text(service.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blue)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .listStyle(PlainListStyle()) // For a clean list style

                    // Back to Home button
                    Button(action: {
                        isOnMainPage = true
                    }) {
                        Text("Back to Home")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true) // Hides the default navigation bar
            }
        }
    }
}

// SwiftUI Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
