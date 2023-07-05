Feature: absa karate test script

  Background: To get the data in xml format
    * url 'http://localhost:8080'

  Scenario Outline: <scenario>
    * def requestXMLBody = karate.readAsString('classpath:org/absa/verify/employee/request.xml')
#    * def responseXMLBody = karate.readAsString('classpath:org/absa/verify/employee/response.xml')
    * def testData = read("testData.csv")

    Given path testData[0].path
    And request requestXMLBody
#    And header Content-type = 'application/xml'
    And header Accept = 'application/xml'
    When method post
    Then status <status>
    And match /Document/CstmrDrctDbtInitn/GrpHdr/MsgId == testData[0].MsgId
    And match /Document/CstmrDrctDbtInitn/GrpHdr/CreDtTm == testData[0].CreDtTm
    And match /Document/CstmrDrctDbtInitn/GrpHdr/NbOfTxs == testData[0].NbOfTxs
    And match /Document/CstmrDrctDbtInitn/GrpHdr/CtrlSum == testData[0].CtrlSum
    And match /Document/CstmrDrctDbtInitn/GrpHdr/InitgPty/Nm == testData[0].name
    And match /Document/CstmrDrctDbtInitn/PmtInf/PmtInfId == testData[0].PmtInfId
    And match /Document/CstmrDrctDbtInitn/PmtInf/PmtMtd == testData[0].PmtMtd
    And match /Document/CstmrDrctDbtInitn/PmtInf/ReqdColltnDt == testData[0].ReqdColltnDt
    And match /Document/CstmrDrctDbtInitn/PmtInf/Cdtr/Nm == testData[0].RefName
    And match /Document/CstmrDrctDbtInitn/PmtInf/Cdtr/CtctDtls/PhneNb == testData[0].RefPhneNb
    And match /Document/CstmrDrctDbtInitn/PmtInf/Cdtr/CtctDtls/EmailAdr == testData[0].RefEmailAdr
    And match /Document/CstmrDrctDbtInitn/PmtInf/CdtrAcct/Id/Othr/Id == testData[0].CdtrAcctId
    And match /Document/CstmrDrctDbtInitn/PmtInf/CdtrAgt/FinInstnId/ClrSysMmbId/MmbId == testData[0].CdtrAgt
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/PmtId/EndToEndId == testData[0].EndToEndId
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/ChrgBr == testData[0].ChrgBr
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DrctDbtTx/MndtRltdInf/MndtId == testData[0].MndtId
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAgt/FinInstnId/ClrSysMmbId/MmbId == testData[0].MmbId
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/Dbtr/Nm == testData[0].Dbtr_Nm
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAcct/Id/Othr/Id == testData[0].DbtrID
    And match /Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAcct/Tp/Prtry == testData[0].Dbtr_Prtry
#    And match requestXMLBody == responseXMLBody
    Then print (testData)


    Examples:
    |read("testData.csv")|


