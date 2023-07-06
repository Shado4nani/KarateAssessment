Feature: absa karate test script

  Background: To get the data in xml format
    * url 'http://localhost:8080'

  @functional
  Scenario Outline: <scenario>
    * def requestXMLBody = karate.readAsString('classpath:org/absa/verify/employee/request.xml')
    * def testData = read("testData.csv")
    * def multiParams = {CtrlSum : '12142835832'}

    Given path testData[0].path
    * params multiParams
    And header Content-type = 'application/xml'
    And request requestXMLBody
    When method post
    Then status <status>
    #Getting test data to compare with the response
    And match response/Document/CstmrDrctDbtInitn/GrpHdr/MsgId == testData[0].MsgId
    And match response/Document/CstmrDrctDbtInitn/GrpHdr/CreDtTm == testData[0].CreDtTm
    And match response/Document/CstmrDrctDbtInitn/GrpHdr/NbOfTxs == testData[0].NbOfTxs
    And match response/Document/CstmrDrctDbtInitn/GrpHdr/CtrlSum == testData[0].CtrlSum
    And match response/Document/CstmrDrctDbtInitn/GrpHdr/InitgPty/Nm == testData[0].name
    And match response/Document/CstmrDrctDbtInitn/PmtInf/PmtInfId == testData[0].PmtInfId
    And match response/Document/CstmrDrctDbtInitn/PmtInf/PmtMtd == testData[0].PmtMtd
    And match response/Document/CstmrDrctDbtInitn/PmtInf/ReqdColltnDt == testData[0].ReqdColltnDt
    And match response/Document/CstmrDrctDbtInitn/PmtInf/Cdtr/Nm == testData[0].RefName
    And match response/Document/CstmrDrctDbtInitn/PmtInf/Cdtr/CtctDtls/PhneNb == testData[0].RefPhneNb
    And match response/Document/CstmrDrctDbtInitn/PmtInf/Cdtr/CtctDtls/EmailAdr == testData[0].RefEmailAdr
    And match response/Document/CstmrDrctDbtInitn/PmtInf/CdtrAcct/Id/Othr/Id == testData[0].CdtrAcctId
    And match response/Document/CstmrDrctDbtInitn/PmtInf/CdtrAgt/FinInstnId/ClrSysMmbId/MmbId == testData[0].CdtrAgt
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/PmtId/EndToEndId == testData[0].EndToEndId
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/ChrgBr == testData[0].ChrgBr
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DrctDbtTx/MndtRltdInf/MndtId == testData[0].MndtId
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAgt/FinInstnId/ClrSysMmbId/MmbId == testData[0].MmbId
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/Dbtr/Nm == testData[0].Dbtr_Nm
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAcct/Id/Othr/Id == testData[0].DbtrID
    And match response/Document/CstmrDrctDbtInitn/PmtInf/DrctDbtTxInf/DbtrAcct/Tp/Prtry == testData[0].Dbtr_Prtry
    Then print (response)


    Examples:
    |read("testData.csv")|


