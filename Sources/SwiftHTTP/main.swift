import Foundation
import SWAPIClient

let baseURL = "https://swapi.dev/api"
let apiClient = SWAPIClient(baseURL: baseURL)

print("About to fetch .people:1")

let sema = DispatchSemaphore(value: 0)

apiClient.fetch(endpoint: SWAPIClient.Endpoint.people, id: 1) { (result: SWPerson?, error) in

    if let person = result {
        print(person)
    } else {
        print("POOOOOOOP!")
    }

    sema.signal()
 
}

sema.wait()