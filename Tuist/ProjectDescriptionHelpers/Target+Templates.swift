import ProjectDescription

public extension Target {

    /// `Target`을 생성한다.
    static func create(
        name: String,
        destinations: Destinations = [.iPhone],
        product: Product,
        minimumVersion: String = AppConfiguration.minimumVersion,
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList = AppConfiguration.sources,
        resources: ResourceFileElements? = AppConfiguration.resources,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .target(
            name: name,
            destinations: destinations,
            product: product,
            bundleId: AppConfiguration.organizationName + name,
            deploymentTargets: .iOS(minimumVersion),
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
    }
}
