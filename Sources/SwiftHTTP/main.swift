import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

print("Fetching data...")

let sema = DispatchSemaphore(value: 0)
let url = URL(string: "https://swapi.dev/api/people/1/")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    print("Response:\n \(String(describing: response))")

    guard let data = data, error == nil else {
        fatalError(error!.localizedDescription)
    }

    print("Fetched data: \(data)")
    
    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            print("JSON:\n\(json)")
        }
    } catch let jsonError {
        print("Failed to serialize JSON: \(jsonError)")
    }

    sema.signal()
}

task.resume()
sema.wait()