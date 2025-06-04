import Testing
@testable import Navigation

@Suite("MissionUseCase", .tags(.useCase, .missionUseCase))
struct MissionUseCaseTest {
    
    @Test func getMissions() async throws {
        let useCase = MissionUseCase()
        let missions = try #require(await useCase.getMissions())
        
        #expect(missions.isEmpty == false)
        #expect(missions.count == 12)
    }
}
