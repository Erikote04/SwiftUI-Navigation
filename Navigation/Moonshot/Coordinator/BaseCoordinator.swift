import SwiftUI

protocol BaseCoordinatorProtocol {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    func push(_ view: AppView)
    func pop()
    func popToRoot()
    
    func presentSheet(_ sheet: Sheet)
    func dismissSheet()
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
    
    func canHandle(view: AppView) -> Bool
}

class BaseCoordinator: BaseCoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    init() {}
    
    func push(_ view: AppView) {
        guard canHandle(view: view) else { return }
        path.append(view)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        if sheet != nil { dismissSheet() }
        if fullScreenCover != nil { dismissFullScreenCover() }
        
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func canHandle(view: AppView) -> Bool {
        fatalError("Las subclases deben implementar canHandle(view:)")
    }
}
