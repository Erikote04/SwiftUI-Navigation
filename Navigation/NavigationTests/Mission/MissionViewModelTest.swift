import Testing
@testable import Navigation

@Suite("MissionViewModel", .tags(.viewModel, .missionViewModel))
struct MissionViewModelTest {

    let viewModel = MissionViewModel()

    @Test func getAstronauts() async throws {
        try #require(await viewModel.getAstronauts())
        #expect(viewModel.astronauts.isEmpty == false)
        #expect(viewModel.astronauts.count == 32)
    }

    @Test func getMissions() async throws {
        try #require(await viewModel.getMissions())
        #expect(viewModel.missions.isEmpty == false)
        #expect(viewModel.missions.count == 12)
    }
}
