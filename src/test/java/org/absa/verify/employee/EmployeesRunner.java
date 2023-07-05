package org.absa.verify.employee;

import com.intuit.karate.junit5.Karate;

class EmployeesRunner {
    
    @Karate.Test
    Karate testEmployees() {
        return Karate.run("classpath:org/absa/verify/employee/Employee.feature").relativeTo(getClass());
    }    

}
