import Foundation

protocol AstronautViewModelProtocol {
    func getAstronauts()
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
    
    func viewAppear() {
        getAstronauts()
    }
    
    func getAstronauts() {
        astronauts = astronautUseCase.getAstronauts()
    }
}
