import XCTest
import BigInt
import ERC2333

final class PrivateChildKeyDerivatorTests: XCTestCase {
    private func sut() -> PrivateChildKeyDerivator {
        .init()
    }

    func testGivenVectorPrivateParentKey_WhenDerivatePrivateChildKey_ThenEqualVectorKey() {
        let privateParentKeys = [
            "6083874454709270928345386274498605044986640685124978867557563392430687146096",
            "29757020647961307431480504535336562678282505419141012933316116377660817309383",
            "27580842291869792442942448775674722299803720648445448686099262467207037398656",
            "19022158461524446591288038168518313374041767046816487870552872741050760015818"
        ]
        let privateChildKeys = [
            "20397789859736650942317412262472558107875392172444076792671091975210932703118",
            "25457201688850691947727629385191704516744796114925897962676248250929345014287",
            "29358610794459428860402234341874281240803786294062035874021252734817515685787",
            "31372231650479070279774297061823572166496564838472787488249775572789064611981"
        ]
        let privateChildKeyIndexes = [0, 3141592653, 4294967295, 42]
        let sut = self.sut()
        for (index, privateParentKey) in privateParentKeys.enumerated() {
            let privateChildKey = sut.privateKey(
                privateParentKey: BigUInt(privateParentKey)!.serialize(),
                index: UInt32(privateChildKeyIndexes[index])
            )
            XCTAssertEqual(BigUInt(privateChildKey), BigUInt(privateChildKeys[index]))
        }
    }
}
