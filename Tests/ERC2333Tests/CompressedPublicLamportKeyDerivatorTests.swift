import XCTest
import Foundation
import BigInt
import BigIntExtensions
@testable import ERC2333

final class CompressedPublicLamportKeyDerivatorTests: XCTestCase {
    func testGivenVectorPrivateParentKey_WhenDerivateCompressedPublicLamportKey_ThenEqualVectorKey() {
        let privateParentKey = Data(unsignedInteger: BigUInt("6083874454709270928345386274498605044986640685124978867557563392430687146096"))
        let compressedPublicLamportKey = CompressedPublicLamportKeyDerivator.publicKey(privateParentKey: privateParentKey, index: 0)
        XCTAssertEqual(BigUInt(compressedPublicLamportKey), BigUInt(hexEncodedString: "0xdd635d27d1d52b9a49df9e5c0c622360a4dd17cba7db4e89bce3cb048fb721a5"))
    }
}
