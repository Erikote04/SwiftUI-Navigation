import Testing
@testable import Navigation

@Suite("AstronautViewModel", .tags(.viewModel, .astronautViewModel))
struct AstronautViewModelTest {

    let viewModel = AstronautViewModel()
    
    @Test func getAstronauts() async throws {
        try #require(await viewModel.getAstronauts())
        
        #expect(viewModel.astronauts.isEmpty == false)
        #expect(viewModel.astronauts.count == 32)
    }
}
