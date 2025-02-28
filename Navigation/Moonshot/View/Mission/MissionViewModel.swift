import Foundation

protocol MissionViewModelProtocol {
    func getMissions()
    func getAstronauts()
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
        getMissions()
        getAstronauts()
    }
    
    func getMissions() {
        missions = missionUseCase.getMissions()
    }
    
    func getAstronauts() {
        astronauts = astronautUseCase.getAstronauts()
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
