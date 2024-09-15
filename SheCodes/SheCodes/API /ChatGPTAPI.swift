import SwiftUI
import Foundation

// Message model
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

// ChatGPT API class
class ChatGPTAPI {
    private var apiKey = "API_KEY"
    private let url = URL(string: "https://api.openai.com/v1/chat/completions")!
    
    init(apiKey: String) {
        self.apiKey = apiKey
        print("ChatGPTAPI initialized with API Key")
    }
    
    func sendMessage(_ message: String, completion: @escaping (String?) -> Void) {
        print("Sending message: \(message)")
        
        // The modified system prompt to match users with the right psychologist based on the list
        let parameters: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "system", "content": """
                Ты эксперт по подбору психологов. Твоя задача — задавать вопросы пользователю на русском языке, чтобы выяснить, с какими проблемами он сталкивается, и на основе его ответов подобрать наиболее подходящего психолога из следующего списка:
                [
                  {
                    "fullName": "Анна Ивановна Мельникова",
                    "phone": "+7 (912) 345-67-89",
                    "email": "anna.melnikova@mail.ru",
                    "description": "Психолог-консультант с 10-летним опытом работы, специализируется на семейной терапии и стресс-менеджменте."
                  },
                  {
                    "fullName": "Олег Александрович Кузнецов",
                    "phone": "+7 (926) 543-21-78",
                    "email": "oleg.kuznetsov@gmail.com",
                    "description": "Специалист в области когнитивно-поведенческой терапии, помогает клиентам справляться с тревожными расстройствами."
                  },
                  {
                    "fullName": "Мария Дмитриевна Соколова",
                    "phone": "+7 (910) 654-32-19",
                    "email": "m.sokolova@yandex.ru",
                    "description": "Психолог с фокусом на работе с детьми и подростками, использует арт-терапию и игровую терапию."
                  },
                  {
                    "fullName": "Евгений Олегович Смирнов",
                    "phone": "+7 (905) 876-54-32",
                    "email": "e.smirnov@psychotherapy.ru",
                    "description": "Ведущий специалист по кризисной психотерапии и травматическим переживаниям."
                  },
                  {
                    "fullName": "Екатерина Сергеевна Петрова",
                    "phone": "+7 (918) 123-45-67",
                    "email": "ekaterina.petrova@mail.ru",
                    "description": "Психоаналитик с 15-летним опытом, специализируется на длительной глубинной терапии."
                  },
                  {
                    "fullName": "Андрей Михайлович Лебедев",
                    "phone": "+7 (916) 987-65-43",
                    "email": "lebedev.andrey@gmail.com",
                    "description": "Психолог, использующий методики гештальт-терапии для работы с эмоциональными блоками и самореализацией."
                  },
                  {
                    "fullName": "Наталья Владимировна Фролова",
                    "phone": "+7 (903) 654-12-98",
                    "email": "n.frolova@outlook.com",
                    "description": "Специалист по работе с депрессивными состояниями и личностными кризисами, предлагает краткосрочные терапевтические программы."
                  },
                  {
                    "fullName": "Дмитрий Евгеньевич Орлов",
                    "phone": "+7 (902) 345-78-12",
                    "email": "d.orlov@psycho.ru",
                    "description": "Психотерапевт с акцентом на экзистенциальную терапию, работает с экзистенциальными кризисами и поиском смысла жизни."
                  },
                  {
                    "fullName": "Ирина Николаевна Васильева",
                    "phone": "+7 (911) 876-54-23",
                    "email": "irina.vasilyeva@gmail.com",
                    "description": "Психолог-консультант по вопросам самооценки, мотивации и личностного роста, работает с методами коучинга."
                  },
                  {
                    "fullName": "Сергей Анатольевич Воронов",
                    "phone": "+7 (921) 432-10-76",
                    "email": "s.voronov@yandex.ru",
                    "description": "Врач-психотерапевт, специализируется на лечении фобий и панических атак с использованием когнитивно-поведенческих техник."
                  }
                ]
                """],
                ["role": "user", "content": message]
            ],
            "max_tokens": 200,
            "temperature": 0.7
        ]
        
        print("Parameters set: \(parameters)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        if let httpBody = request.httpBody {
            print("HTTP Body: \(String(data: httpBody, encoding: .utf8) ?? "nil")")
        } else {
            print("Failed to encode HTTP body")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error in network request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Received response with status code: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received data: \(jsonString)")
            }
            
            if let response = try? JSONDecoder().decode(ChatGPTResponse.self, from: data),
               let reply = response.choices.first?.message.content {
                print("Reply from GPT: \(reply)")
                completion(reply.trimmingCharacters(in: .whitespacesAndNewlines))
            } else {
                print("Failed to decode response")
                completion(nil)
            }
        }
        task.resume()
        print("Task resumed")
    }
}

// ChatGPT response struct
struct ChatGPTResponse: Codable {
    struct Choice: Codable {
        struct Message: Codable {
            let content: String
        }
        let message: Message
    }
    let choices: [Choice]
}
