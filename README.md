# KarateAssessment

Step 1:
Clone the project.
Go to master branch.
Do clean install. all dependencies will be installed.
(Suggested IDE = Intellij)
Java 11 install
You can replace the url as I have created a dummy endpoint locally.
paths can also be updated in the testData file.
Status are also stored in the testData.

Step 2:
Run from cammand line -
  mvn clean test  -Dkarate.options="--tags @functionals"
Run from IDE -
  run EmployeeeTest.java for parallel run EmployeeTest
  
Step 3:
Test data is sitting under testData.csv
Request body = request.xml

Step 4:
Check reports under the reports path -
**///Users/<your domain>/IdeaProjects/karateAPITesting/target/karate-reports/karate-summary.html**

