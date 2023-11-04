import Foundation
import CryptoKit
import BigInt

struct PrivateKeyDerivator {
    private static let outputByteCount = UInt16(48)
    private static let salt = Data(SHA256.hash(data: "BLS-SIG-KEYGEN-SALT-".data(using: .ascii)!))
    private static let curveOrder = BigUInt("52435875175126190479447740508185965837690552500527637822603658699938581184513")

    static func privateKey(data: Data) -> Data {
        guard data.count >= 32 else {
            preconditionFailure()
        }
        let inputKeyMaterial = SymmetricKey(data: data + [UInt8(0)])
        let derivedKey = HKDF<SHA256>
            .deriveKey(
                inputKeyMaterial: inputKeyMaterial,
                salt: salt,
                info: outputByteCount.bytes,
                outputByteCount: Int(outputByteCount)
            )
            .withUnsafeBytes { Data($0) }
        let modulusKey = BigUInt(derivedKey) % curveOrder
        guard !modulusKey.isZero else {
            return privateKey(data: data)
        }
        return modulusKey.serialize()
    }
    private init() {}
}
