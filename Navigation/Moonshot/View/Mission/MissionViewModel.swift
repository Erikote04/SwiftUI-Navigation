import Foundation

protocol MissionViewModelProtocol {
    func getMissions() async throws
    func getAstronauts() async throws
    func getCrew(mission: Mission, astronauts: [String: Astronaut])
}

final class MissionViewModel: ObservableObject, MissionViewModelProtocol {
    @Published var missions: [Mission] = []
    @Published var astronauts: [String: Astronaut] = [:]
    @Published var crew: [CrewMember] = []
    @Published var isShowingGrid: Bool = true
    
    private let missionUseCase: MissionUseCaseProtocol
    private let astronautUseCase: AstronautUseCaseProtocol
    var mission: Mission? = nil
    
    init(missionUseCase: MissionUseCaseProtocol = MissionUseCase(), astronautUseCase: AstronautUseCaseProtocol = AstronautUseCase()) {
        self.missionUseCase = missionUseCase
        self.astronautUseCase = astronautUseCase
    }
    
    func onAppear() {
        Task {
            try await getMissions()
            try await getAstronauts()
        }
    }
    
    func getMissions() async throws {
        let result = try await missionUseCase.getMissions()
        
        await MainActor.run {
            self.missions = result
        }
    }
    
    func getAstronauts() async throws {
        let result = try await astronautUseCase.getAstronauts()
        
        await MainActor.run {
            self.astronauts = result
        }
    }
    
    func getCrew(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}
