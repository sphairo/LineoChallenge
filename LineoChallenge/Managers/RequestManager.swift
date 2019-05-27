import Foundation

public enum HttpMethod:String {
    case GET
}

class RequestManager {
    
    func request(with urlString: String, body: Data?, method:HttpMethod, completion: @escaping (_ success: Bool, _ object: Data?, _ error: Error?, _ statusCode: Int?) -> ()) {
        guard URL.init(string: urlString) != nil else {return}
        let request = createRequestWithtUrlString(urlString: urlString, method: method)
        self.dataTaskWithStatusCode(request: request, completion: completion)
    }
    
    private func createRequestWithtUrlString(urlString:String, method:HttpMethod) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = method.rawValue
        return request
    }
    
    private func dataTaskWithStatusCode(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: Data?, _ error: Error?, _ statusCode: Int?) -> ()) {
        let session = createURLSession()
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data, let response = response as? HTTPURLResponse {
                if 200...299 ~= response.statusCode {
                    completion(true, data, error, response.statusCode)
                } else {
                    completion(false, data, error, response.statusCode)
                }
            } else {
                completion(false, data, error, nil)
            }
            }.resume()
    }
    
    private func createURLSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30.0
        sessionConfiguration.timeoutIntervalForResource = 30.0
        let urlSession = URLSession(configuration: sessionConfiguration)
        return urlSession
    }
}
