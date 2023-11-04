import Foundation
import CryptoKit

struct PublicLamportKeyDerivator {
    static func publicKey(privateKey: [Data]) -> [Data] {
        privateKey.map { Data(SHA256.hash(data: $0)) }
    }
    private init() {}
}
