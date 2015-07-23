enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
    
    
    func map<U>(transform: T -> U) -> Result<U, Error> {
        switch self {
        case .Failure(let error):
            return .Failure(error)
        case .Success(let value):
            return .Success(transform(value))
        }
    }
    
    func flatMap<U>(transform: T -> Result<U, Error>) -> Result<U, Error> {
        switch self {
        case .Failure(let error):
            return .Failure(error)
        case .Success(let value):
            return transform(value)
        }
    }
    
}
