//
//  GBFileSelector.swift
//  GBUILibrary
//
//  Created by Guillaume Blanchet on 03/02/2025.
//

import SwiftUI
import UniformTypeIdentifiers

public struct GBFileSelector: View {

    public enum FileType {
        case gpx
        case other
    }

    private var fileType: FileType
    @State private var selectedFileURL: URL?
    @State private var showingImporter = false

    public init(selectedFileURL: URL? = nil, fileType: FileType = .other) {
        self.selectedFileURL = selectedFileURL
        self.fileType = fileType
    }

    public var body: some View {
        VStack {
            Text(getTitleIndicator())
                .padding()
            GBButton(title: getButtonTitle(), colorTheme: .blue) {
                selectFile()
            }
        }
        .fileImporter(
            isPresented: $showingImporter,
            allowedContentTypes: getTypeFilter(),
            allowsMultipleSelection: false
        ) { result in
            handleFileImport(result: result)
        }
    }

    private func getTitleIndicator() -> String {
        guard let fileURL = selectedFileURL else {
            return "Aucun fichier sélectionné"
        }

        return "Fichier sélectionné : \(fileURL.lastPathComponent)"
    }

    private func getButtonTitle() -> String {
        var titleSuffix: String = ""
        switch fileType {
            case .gpx: titleSuffix = " .gpx"
            case .other: titleSuffix = ""
        }
        return "Sélectionner un fichier\(titleSuffix)"
    }

    private func getTypeFilter() -> [UTType] {
        switch fileType {
            case .gpx: return [.gpx]
            case .other: return []
        }
    }

    private func selectFile() {
        showingImporter = true
    }

    private func handleFileImport(result: Result<[URL], Error>) {
        switch result {
            case .success(let urls):
                selectedFileURL = urls.first
            case .failure(let error):
                print("Erreur de sélection du fichier : \(error.localizedDescription)")
        }
    }
}

#Preview {
    GBFileSelector(fileType: .gpx)
}
