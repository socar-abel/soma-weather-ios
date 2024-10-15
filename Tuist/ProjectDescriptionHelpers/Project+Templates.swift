import ProjectDescription

public extension Project {
    
    /// `Project`를 생성한다.
    static func create(
        module: Module,
        product: Product,
        infoPlist: InfoPlist = .default,
        targetResources: ResourceFileElements? = nil,
        targetDependencies: [TargetDependency] = [],
        targetBaseSettings: ProjectDescription.SettingsDictionary = [:]
    ) -> Project {
        Project(
            name: module.name,
            organizationName: AppConfiguration.organizationName,
            options: .options(
                automaticSchemesOptions: .disabled
            ),
            settings: .settings(
                configurations: [
                    .debug(
                        name: AppConfiguration.debugConfig,
                        settings: ["SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG"]
                   )
                ]
            ),
            targets: [
                Target.create(
                    name: module.name,
                    product: product,
                    infoPlist: infoPlist,
                    dependencies: targetDependencies
                )
            ],
            /*
             archiveAction, profileAction, analyzeAction 을 추가 세팅할 수 있으나, 예제 용 앱이기 때문에 설정하지 않았다.
             또한, Debug / Qualify / Release 등 BuildConfig 를 더 세분화하는 게 좋을 것이다.
             */
            schemes: [
                .scheme(
                    name: module.name + AppConfiguration.debugConfig.toString(),
                    buildAction: .buildAction(targets: [.project(path: module.path, target: module.name)]),
                    runAction: .runAction(configuration: AppConfiguration.debugConfig)
                )
            ]
        )
    }
}
