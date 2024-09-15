//
//  AddFormView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 14.09.2024.
//

import SwiftUI




struct AddFormView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // Dismiss the form
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.purple)
                        .padding()
                }
            }
            .padding()
            
            Text("Zhanuardy qosy")
                .font(.title)
                .foregroundColor(Color.purple)
                .padding(.bottom, 20)
            
            // Form fields
            TextField("Esimi", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(Color.purple)
                .padding(.bottom, 10)

            TextField("Meken zhaiy", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(Color.purple)
                .padding(.bottom, 10)

            TextField("Sipattamasy", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(Color.purple)
                .padding(.bottom, 10)

            TextField("Sureti", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(Color.purple)
                .padding(.bottom, 20)

            // Submit Button
            Button(action: {
                // Submit the form
            }) {
                Text("Jiberu")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}


#Preview {
    AddFormView()
}


