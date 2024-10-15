import ProjectDescription

public extension Target {

    static func create(
        name: String,
        destinations: Destinations = [.iPhone],
        product: Product,
        bundleId: String = AppConfiguration.bundleId,
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
            bundleId: bundleId,
            deploymentTargets: .iOS(minimumVersion),
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
    }
}
