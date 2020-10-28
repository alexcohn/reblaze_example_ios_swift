//
//  ReblazeSDK_ExampleTests.swift
//  ReblazeSDK-ExampleTests
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2020 Reblaze. All rights reserved.
//

import XCTest
import ReblazeSDK

class ReblazeSDK_ExampleTests: XCTestCase {

    override func setUp() {
        print("ReblazeSDKVersionNumber=\(ReblazeSDKVersionNumber)")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPP() {
        do {
            try Reblaze.configure(secret: "c3f20abc1e37434492d6cb1781732406", uid: "DD2F0785-9539-4796-94A7-6D71F3A62936")
            let hash = try Reblaze.getHash(unixTimestamp: 1602852968)
            print(hash)
            XCTAssertEqual(hash, "bebc137267d99e86556188b25f1d3ffd")
        }
        catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
            XCTAssertNil(error)
        }
    }

    func testFB1() { // this failed on https://fishbrain.app.reblaze.io/zoomlog because they used uid1 for start(), but planted uid2 in the request
        do {
            let uid1 = "Bearer eyJraWQiOiJUYzE5NHF4elpSeExUUFZqcnRsb1FRQlBtOUt5MmhFMmVOU2x3Q2xlOEFjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6Im9wZW5pZCBlbWFpbCIsImF1dGhfdGltZSI6MTYwMjk3NDE4OCwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmV1LXdlc3QtMS5hbWF6b25hd3MuY29tXC9ldS13ZXN0LTFfVEtXdmVJY1l1IiwiZXhwIjoxNjAzMDE5NDgyLCJpYXQiOjE2MDMwMTU4ODIsInZlcnNpb24iOjIsImp0aSI6IjRhNzc0NWNmLTk4YTMtNGJiYy04MWI4LTQzZTdiNzc3NGEyNCIsImNsaWVudF9pZCI6IjRsdHU3ZWhrN2U4aG41YWNxa2luNjRxNDY3IiwidXNlcm5hbWUiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYifQ.a5MfqECJatcrKGH0ixB9JLu_qmZJ1VsoTaCcjfcouL0Uj7JjUiVvIdqt4u82w-Ra-Dpui-DfrVAICG6zrlX95wIxTNPNuYxKMEkM_557QljTV47sN70pl8FM_phqRcWQ-z2atF-GN3lEt-uaJzriQ57lioKqxju6VMiLHneI_4rN8jg5K__fWjrDktrOMEkwLnVdBURdGlZ3odt_On2-4Th3C3PkTSzWCVjghwZ7xLWJBDZ2CQtVW7QyR3dn1d-XW7XS7nM3PZKsnGlWS9WKKK9VOUAOmfejS-qdzf-Wp4btV9EFvaURisvNK4LS1CfBGYc5pDWS8n9We4vaSDG9VQ"
            let uid2 = "Bearer eyJraWQiOiJUYzE5NHF4elpSeExUUFZqcnRsb1FRQlBtOUt5MmhFMmVOU2x3Q2xlOEFjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6Im9wZW5pZCBlbWFpbCIsImF1dGhfdGltZSI6MTYwMjk3NDE4OCwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmV1LXdlc3QtMS5hbWF6b25hd3MuY29tXC9ldS13ZXN0LTFfVEtXdmVJY1l1IiwiZXhwIjoxNjAyOTc3Nzg4LCJpYXQiOjE2MDI5NzQxODgsInZlcnNpb24iOjIsImp0aSI6ImI2YTZiOGZjLWI1MmQtNGZiYi04ODI3LWI1YjQ4ZmMzOGQxYyIsImNsaWVudF9pZCI6IjRsdHU3ZWhrN2U4aG41YWNxa2luNjRxNDY3IiwidXNlcm5hbWUiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYifQ.PdVVzpxDaBIjYCYRtZtTKgdySa13CI1OX6CtZgas_2-4IBBrBNd1A5QpqXGNoDLiPrt0_Ah1XjxYILzG-fmgMXWnb1R_Ot_ii9TRvqGELheyjw0XZHX5tD6xjF4mT4V6UptQK4A1EuLppBUA8IxPoSr5FBN9oPFqHmTvmODpDqewISC4UBttzqIJtUOo-emAFE1kFBsxGG5w48cuZyHVK_eA8BJf1BJcozxxLnDKuaxLezAxcNPSz_MGZSaaW-mFDUqpbulRWDlGPHnoUEW23dcNYb0bHwnwZ-eMrEvvJjqjVIFiY9i_xzzFDWC6ZRUr1wdiF4nxkaSsbWqVaX7Epg"
            let secret = "3d1a12ea54ad18f04e6a7dd81550c350"
            try Reblaze.configure(secret: secret, uid: uid2)
            let hash = try Reblaze.getHash(unixTimestamp: 1603015886)
            print(hash)
            XCTAssertEqual(hash, "844507e793e7df808c712683ea2f45e7")
        }
        catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
            XCTAssertNil(error)
        }
    }

    func testFB2() { // this marked as Human on https://fishbrain.app.reblaze.io/zoomlog
        do {
            let uid1 = "Bearer eyJraWQiOiJUYzE5NHF4elpSeExUUFZqcnRsb1FRQlBtOUt5MmhFMmVOU2x3Q2xlOEFjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6Im9wZW5pZCBlbWFpbCIsImF1dGhfdGltZSI6MTYwMjk3NDE4OCwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmV1LXdlc3QtMS5hbWF6b25hd3MuY29tXC9ldS13ZXN0LTFfVEtXdmVJY1l1IiwiZXhwIjoxNjAzMDE5NDgyLCJpYXQiOjE2MDMwMTU4ODIsInZlcnNpb24iOjIsImp0aSI6IjRhNzc0NWNmLTk4YTMtNGJiYy04MWI4LTQzZTdiNzc3NGEyNCIsImNsaWVudF9pZCI6IjRsdHU3ZWhrN2U4aG41YWNxa2luNjRxNDY3IiwidXNlcm5hbWUiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYifQ.a5MfqECJatcrKGH0ixB9JLu_qmZJ1VsoTaCcjfcouL0Uj7JjUiVvIdqt4u82w-Ra-Dpui-DfrVAICG6zrlX95wIxTNPNuYxKMEkM_557QljTV47sN70pl8FM_phqRcWQ-z2atF-GN3lEt-uaJzriQ57lioKqxju6VMiLHneI_4rN8jg5K__fWjrDktrOMEkwLnVdBURdGlZ3odt_On2-4Th3C3PkTSzWCVjghwZ7xLWJBDZ2CQtVW7QyR3dn1d-XW7XS7nM3PZKsnGlWS9WKKK9VOUAOmfejS-qdzf-Wp4btV9EFvaURisvNK4LS1CfBGYc5pDWS8n9We4vaSDG9VQ"
            let uid2 = "Bearer eyJraWQiOiJUYzE5NHF4elpSeExUUFZqcnRsb1FRQlBtOUt5MmhFMmVOU2x3Q2xlOEFjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6Im9wZW5pZCBlbWFpbCIsImF1dGhfdGltZSI6MTYwMjk3NDE4OCwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmV1LXdlc3QtMS5hbWF6b25hd3MuY29tXC9ldS13ZXN0LTFfVEtXdmVJY1l1IiwiZXhwIjoxNjAyOTc3Nzg4LCJpYXQiOjE2MDI5NzQxODgsInZlcnNpb24iOjIsImp0aSI6ImI2YTZiOGZjLWI1MmQtNGZiYi04ODI3LWI1YjQ4ZmMzOGQxYyIsImNsaWVudF9pZCI6IjRsdHU3ZWhrN2U4aG41YWNxa2luNjRxNDY3IiwidXNlcm5hbWUiOiIyZTQ2MGUyZS02N2Y2LTRiOTItOWY2NC0xYjQ0N2FhYzZiOGYifQ.PdVVzpxDaBIjYCYRtZtTKgdySa13CI1OX6CtZgas_2-4IBBrBNd1A5QpqXGNoDLiPrt0_Ah1XjxYILzG-fmgMXWnb1R_Ot_ii9TRvqGELheyjw0XZHX5tD6xjF4mT4V6UptQK4A1EuLppBUA8IxPoSr5FBN9oPFqHmTvmODpDqewISC4UBttzqIJtUOo-emAFE1kFBsxGG5w48cuZyHVK_eA8BJf1BJcozxxLnDKuaxLezAxcNPSz_MGZSaaW-mFDUqpbulRWDlGPHnoUEW23dcNYb0bHwnwZ-eMrEvvJjqjVIFiY9i_xzzFDWC6ZRUr1wdiF4nxkaSsbWqVaX7Epg"
            let secret = "3d1a12ea54ad18f04e6a7dd81550c350"
            try Reblaze.configure(secret: secret, uid: uid1)
            let hash = try Reblaze.getHash(unixTimestamp: 1603015886)
            print(hash)
            XCTAssertEqual(hash, "bba4ff683b1ef46e14d54ed18c1a0e75")
        }
        catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
            XCTAssertNil(error)
        }
    }

    func testExample() {
        do {
            try Reblaze.configure(secret: "secret", uid: "uid")
            var hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "d20240f5ceec37dacaa55fa45d91b4d8")
            try Reblaze.configure(secret: "secret1", uid: "uid")
            hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "b3a131323f8023d60c7edfe5968e42c4")
            try Reblaze.configure(secret: "secret", uid: "uid1")
            hash = try Reblaze.getHash(unixTimestamp: 123456)
            print(hash)
            XCTAssertEqual(hash, "06d3d4600ff25781df2349afe6553f0e")
        }
        catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
            XCTAssertNil(error)
        }
    }
}
