import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Logo
                Image("your_logo") // Replace with your actual logo's image name
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

                NavigationLink(destination: ContentView()) {
                    Text("Book a Service")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
