import Foundation
import BinaryExtensions
import CryptoKit

struct CompressedPublicLamportKeyDerivator {
    static func publicKey(privateParentKey: Data, index: UInt32) -> Data {
        let salt = Data(index.bigEndian.bytes)
        let privateKey1 = PrivateLamportKeyDerivator.privateKey(privateParentKey: privateParentKey, salt: salt)
        let privateKey2 = PrivateLamportKeyDerivator.privateKey(privateParentKey: Data(privateParentKey.map { ~$0 }), salt: salt)
        let publicKey = PublicLamportKeyDerivator.publicKey(privateKey: privateKey1 + privateKey2).reduce(Data(), +)
        return Data(SHA256.hash(data: publicKey))
    }
    private init() {}
}
