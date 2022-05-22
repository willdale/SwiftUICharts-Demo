//
//  ShareHomeView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 22/05/2022.
//

import Combine
import SwiftUI
import SwiftUICharts

#if canImport(UIKit)
fileprivate enum ActiveSheet: String, Identifiable {
    case photoLibrary, shareSheet
    var id: String {
        return self.rawValue
    }
}

struct ShareHomeView: View {
    
    var chartImageController = ChartImageController()
    @State var showImage = false
    @State var image = UIImage()
    @State var bag = Set<AnyCancellable>()
    
    @State private var shareCardAsImage: UIImage? = nil
    @State fileprivate var  activeSheet: ActiveSheet? = nil
    
    var shareCard: some View {
        LineChartDemoView()
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
    }
    
    var body: some View {
        Button {
            let controller = ChartImageHostingController(rootView: shareCard)
            controller.finalImage
                .sink { completion in
                    self.chartImageController.controller = nil
                } receiveValue: { image in
                    self.shareCardAsImage = image
                    self.activeSheet = .shareSheet
                }
                .store(in: &bag)
            controller.start()
            chartImageController.controller = controller
            
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 20))
                Text("Share")
                    .font(.headline)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding(.horizontal)
        .sheet(item: $activeSheet) { [shareCardAsImage] sheet in
            switch sheet {
            case .photoLibrary:
                Text("TODO")
            case .shareSheet:
                if let unwrappedImage = shareCardAsImage {
                    ShareSheet(photo: unwrappedImage)
                }
                
            }
        }
    }
}

struct RecoveryShareHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShareHomeView().preferredColorScheme(.dark)
        ShareHomeView().preferredColorScheme(.light)
    }
}
#endif


import LinkPresentation

//This code is from https://gist.github.com/tsuzukihashi/d08fce005a8d892741f4cf965533bd56
struct ShareSheet: UIViewControllerRepresentable {
    let photo: UIImage
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityItems: [Any] = [photo]
        return UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
    }
    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
        
    }
}
