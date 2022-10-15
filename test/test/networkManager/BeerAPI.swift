import Foundation

enum BeerAPI: API {
    
    case link
    
    var scheme: HTTPScheme {
        switch self {
        case .link:
            return .https
        }
    }
    var method: HTTPMethod {
        switch self {
        case .link:
            return .get
        }
    }
    var baseURL: String {
        switch self {
        case .link:
            return "api.punkapi.com"
        }
    }
        
    var path: String {
        switch self {
        case .link:
            return "/v2/beers"
        }
    }
}
