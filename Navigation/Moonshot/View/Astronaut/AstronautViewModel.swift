import Foundation

protocol AstronautViewModelProtocol {
    func getAstronauts() async throws
}

final class AstronautViewModel: ObservableObject, AstronautViewModelProtocol {
    @Published var astronauts: [String: Astronaut] = [:]
    
    private let astronautUseCase: AstronautUseCaseProtocol
    
    var sortedAstronautsByName: [Astronaut] {
        astronauts.values.sorted { $0.name < $1.name }
    }
    
    init(astronautsUseCase: AstronautUseCaseProtocol = AstronautUseCase()) {
        self.astronautUseCase = astronautsUseCase
    }
    
    func onAppear() {
        Task { try await getAstronauts() }
    }
    
    func getAstronauts() async throws {
        let result = try await astronautUseCase.getAstronauts()
        
        await MainActor.run {
            astronauts = result
        }
    }
}
