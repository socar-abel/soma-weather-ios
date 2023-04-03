import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let injector: Injector = DependencyInjector(container: Container())
    private var appCoordinator: DefaultAppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        window = .init(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        appCoordinator = DefaultAppCoordinator(dependency: .init(navigationController: navigationController, injector: injector))
        
        injector.assemble([DataAssembly(),
                           DomainAssembly(),
                           HomeAssembly(),
                           ForecastAssembly()])
        appCoordinator?.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
