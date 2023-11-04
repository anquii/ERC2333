import Foundation

public protocol PrivateMasterKeyDerivating {
    func privateKey(seed: Data) -> Data
}

public struct PrivateMasterKeyDerivator: PrivateMasterKeyDerivating {
    public func privateKey(seed: Data) -> Data {
        PrivateKeyDerivator.privateKey(data: seed)
    }
    public init() {}
}
