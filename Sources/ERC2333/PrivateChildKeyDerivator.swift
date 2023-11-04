import Foundation

public protocol PrivateChildKeyDerivating {
    func privateKey(privateParentKey: Data, index: UInt32) -> Data
}

public struct PrivateChildKeyDerivator: PrivateChildKeyDerivating {
    public func privateKey(privateParentKey: Data, index: UInt32) -> Data {
        let compressedPublicLamportKey = CompressedPublicLamportKeyDerivator.publicKey(privateParentKey: privateParentKey, index: index)
        return PrivateKeyDerivator.privateKey(data: compressedPublicLamportKey)
    }
    public init() {}
}
