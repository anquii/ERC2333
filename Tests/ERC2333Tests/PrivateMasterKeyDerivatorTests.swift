import XCTest
import Foundation
import BigInt
import BigIntExtensions
import ERC2333

final class PrivateMasterKeyDerivatorTests: XCTestCase {
    private func sut() -> PrivateMasterKeyDerivator {
        .init()
    }

    func testGivenVectorSeed_WhenDerivatePrivateMasterKey_ThenEqualVectorKey() {
        let hexEncodedSeeds = [
            "0xc55257c360c07c72029aebc1b53c05ed0362ada38ead3e3e9efa3708e53495531f09a6987599d18264c1e1c92f2cf141630c7a3c4ab7c81b2f001698e7463b04",
            "0x3141592653589793238462643383279502884197169399375105820974944592",
            "0x0099FF991111002299DD7744EE3355BBDD8844115566CC55663355668888CC00",
            "0xd4e56740f876aef8c010b86a40d5f56745a118d0906a34e69aec8c0db1cb8fa3"
        ]
        let privateMasterKeys = [
            "6083874454709270928345386274498605044986640685124978867557563392430687146096",
            "29757020647961307431480504535336562678282505419141012933316116377660817309383",
            "27580842291869792442942448775674722299803720648445448686099262467207037398656",
            "19022158461524446591288038168518313374041767046816487870552872741050760015818"
        ]
        let sut = self.sut()
        for (index, hexEncodedSeed) in hexEncodedSeeds.enumerated() {
            let seed = Data(unsignedInteger: BigUInt(hexEncodedString: hexEncodedSeed)!, minimumLength: 32)
            let privateMasterKey = sut.privateKey(seed: seed)
            XCTAssertEqual(BigUInt(privateMasterKey), BigUInt(privateMasterKeys[index]))
        }
    }
}
