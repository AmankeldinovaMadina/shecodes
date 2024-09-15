import SwiftUI


// Chat View
struct ChatView: View {
    @State private var inputText = ""
    @State private var messages: [Message] = [
        Message(text: "Добрый день, я здесь, чтобы помочь вам найти самого подходящего психолога, с которым вам будет комфортно работать! Скажите, что вас беспокоит?", isUser: false)
    ]
    @State private var isLoading = false
    @State private var isPsychologyView = false
    
    let chatGPTAPI = ChatGPTAPI(apiKey: "API_KEY")
    
    var body: some View {
        if isPsychologyView {
            PhsychologyView()
        } else {
            VStack {
                // Navigation Bar at the top
                HStack {
                    Button(action: {
                        isPsychologyView = true
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                            .foregroundColor(.purple)
                    }
                    
                    Spacer()
                    
                    Text("Chat with AI")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "873399"))
                    
                    Spacer()
                }
                .padding()
                
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(messages) { message in
                                HStack {
                                    if message.isUser {
                                        Spacer()
                                        Text(message.text)
                                            .padding()
                                            .background(Color(hex: "873399"))
                                            .cornerRadius(15)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    } else {
                                        Text(message.text)
                                            .padding()
                                            .background(Color(hex: "64D5C8"))
                                            .cornerRadius(15)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .onChange(of: messages.count) { _ in
                        scrollViewProxy.scrollTo(messages.last?.id, anchor: .bottom)
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .padding()
                }
                
                // Input area
                HStack {
                    TextField("Send message", text: $inputText)
                        .padding(15)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(hex: "873399"))
                        .background(Color(hex: "D9D9D9")).opacity(0.5)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                        .padding(.leading)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .foregroundColor(Color(hex: "873399"))
                            .frame(width: 40, height: 40)
                    }
                    .disabled(inputText.isEmpty || isLoading)
                    .padding(.trailing)
                }
                .padding(.bottom, 10)
                .background(Color.white)
            }
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func sendMessage() {
        let userMessage = Message(text: inputText, isUser: true)
        messages.append(userMessage)
        inputText = ""
        isLoading = true
        
        chatGPTAPI.sendMessage(userMessage.text) { response in
            DispatchQueue.main.async {
                print("Sending message")
                isLoading = false
                if let response = response {
                    let botMessage = Message(text: response, isUser: false)
                    messages.append(botMessage)
                }
            }
        }
    }
}

// Hex color extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
