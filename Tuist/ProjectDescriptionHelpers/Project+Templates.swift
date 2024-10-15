import ProjectDescription

public extension Project {

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
            ]
        )
    }
}
