//
//  Injector.swift
//  Pods
//
//  Created by Colton Nohelty on 6/8/17.
//
//

import Swinject
import RxSwift

public enum Environment {
    case mock, staging, prod
}

class Injector {
    private static let dependencyGraph = Container()
    private static let mainSchedulerName = "mainScheduler"
    
    static func setup(environment: Environment) {
        switch environment {
        case .mock:
            buildMockDependencyGraph()
        case .staging, .prod:
            buildDefaultDependencyGraph()
        }
    }
    
    static func resolve<T>(_ dependencyType: T.Type) -> T {
        return dependencyGraph.resolve(dependencyType)!
    }
    
    static func resolveMainScheduler() -> ImmediateSchedulerType {
        return dependencyGraph.resolve(ImmediateSchedulerType.self, name: mainSchedulerName)!
    }
    
    static func register(delegate: PaymentasaurusSDKDelegate) {
        dependencyGraph.register(PaymentasaurusSDKDelegate.self) { _ in delegate }.inObjectScope(.container)
    }
    
    private static func buildMockDependencyGraph() {
        dependencyGraph.register(PaymentasaurusRemoteDataStoring.self) { _ in UITestPaymentRemoteDataStore() }.inObjectScope(.container)
        dependencyGraph.register(PaymentasaurusInteracting.self) { _ in PaymentasaurusInteractor() }.inObjectScope(.container)
        dependencyGraph.register(AuthorizationInteracting.self) { _ in AuthorizationInteractor() }.inObjectScope(.container)
        dependencyGraph.register(ImmediateSchedulerType.self, name: mainSchedulerName) { _ in MainScheduler.instance }.inObjectScope(.container)
        dependencyGraph.register(SubscriptionInteracting.self) { _ in SubscriptionInteractor() }.inObjectScope(.container)
    }
    
    private static func buildDefaultDependencyGraph() {
        dependencyGraph.register(PaymentasaurusRemoteDataStoring.self) { _ in PaymentasaurusRemoteDataStore() }.inObjectScope(.container)
        dependencyGraph.register(PaymentasaurusInteracting.self) { _ in PaymentasaurusInteractor() }.inObjectScope(.container)
        dependencyGraph.register(RestHelper.self) { _ in RestHelper(withBaseUrl: EnvironmentConstants.paymentasaurusBaseUrl) }.inObjectScope(.container)
        dependencyGraph.register(AuthorizationInteracting.self) { _ in AuthorizationInteractor() }.inObjectScope(.container)
        dependencyGraph.register(ImmediateSchedulerType.self, name: mainSchedulerName) { _ in MainScheduler.instance }.inObjectScope(.container)
        dependencyGraph.register(SubscriptionInteracting.self) { _ in SubscriptionInteractor() }.inObjectScope(.container)
    }
}
