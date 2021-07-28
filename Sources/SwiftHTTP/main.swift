import Foundation

#if os(Linux)
import FoundationNetworking
#endif

print("Fetching data...")

let sema = DispatchSemaphore(value: 0)
let url = URL(string: "https://swapi.dev/api/people/1/")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    print(response ?? "response: nil")
    guard let data = data, error == nil else {
        fatalError(error!.localizedDescription)
    }

    print("Fetched data: \(data)")
    sema.signal()
}

task.resume()
sema.wait()