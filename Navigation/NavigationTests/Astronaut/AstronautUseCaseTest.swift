import Testing
@testable import Navigation

@Suite("AstronautUseCase", .tags(.useCase, .astronautUseCase))
struct AstronautUseCaseTest {

    @Test func getAstronauts() async throws {
        let useCase = AstronautUseCase()
        let astronauts = try #require(await useCase.getAstronauts())
        
        #expect(astronauts.isEmpty == false)
        #expect(astronauts.count == 32)
    }
}
