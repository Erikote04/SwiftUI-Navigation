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

/// Presenting a sheet inside another sheet or a fullScreenCover can sometimes have unexpected behaviors.
/// This flow should be avoided, but if you still want to do it, here are some advertisements:

/// You CAN'T define the sheets in the same view.
/// You MUST define the action in the corresponding view

/// Here's an example of what not to do. This example will not cause problems if the sheet(s) and/or fullScreenCover(s) are not related:

/// coordinator.build(.home)
///     .navigationDestination(for: AppView.self) { view in
///         coordinator.build(view)
///     }
///     .sheet(item: $coordinator.sheet) { sheet in
///         coordinator.build(sheet)
///     }
///     .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
///         coordinator.build(fullScreenCover)
///     }

/// If you want to navigate inside a sheet or a fullScreenCover you must implement the following lines inside the corresponding build function

/// NavigationStack(path: Binding(get: { self.path }, set: { self.path = $0 })) {
///     YourView(coordinator: self)
///         .navigationDestination(for: AppView.self) { view in
///             self.build(view)
///         }
/// }
