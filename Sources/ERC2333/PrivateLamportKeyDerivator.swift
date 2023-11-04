import Foundation
import CryptoKit

struct PrivateLamportKeyDerivator {
    private static let sliceLength = 32

    static func privateKey(privateParentKey: Data, salt: Data) -> [Data] {
        let inputKeyMaterial = SymmetricKey(data: privateParentKey)
        let derivedKey = HKDF<SHA256>
            .deriveKey(inputKeyMaterial: inputKeyMaterial, salt: salt, outputByteCount: 8160)
            .withUnsafeBytes { Data($0) }
        var slicedData = [Data]()
        for i in 0..<(derivedKey.count / sliceLength) {
            let startIndex = derivedKey.index(derivedKey.startIndex, offsetBy: i * sliceLength)
            let endIndex = derivedKey.index(startIndex, offsetBy: sliceLength)
            slicedData.append(derivedKey[startIndex..<endIndex])
        }
        return slicedData
    }
    private init() {}
}
