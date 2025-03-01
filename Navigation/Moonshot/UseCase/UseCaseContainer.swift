import Foundation

protocol UseCaseProtocol {}

final class UseCaseContainer {
    static let shared = UseCaseContainer()
    
    private var useCases: [String: Any] = [:]
    
    private init() {
        register(AstronautUseCase() as AstronautUseCaseProtocol)
        register(MissionUseCase() as MissionUseCaseProtocol)
        register(LogLoginUseCase() as LogLoginUseCaseProtocol)
    }
    
    private func register<T>(_ useCase: T) {
        let key = String(describing: T.self)
        useCases[key] = useCase
    }
    
    func getCurrentUseCase<T>() -> T {
        let key = String(describing: T.self)
        
        guard let useCase = useCases[key] as? T else {
            fatalError("No se encontró el UseCase \(T.self)")
        }
        
        return useCase
    }
}
