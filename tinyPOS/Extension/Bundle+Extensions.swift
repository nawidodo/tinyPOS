import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch (let error) {
            print(error.localizedDescription)
        }

        return nil
    }
}
