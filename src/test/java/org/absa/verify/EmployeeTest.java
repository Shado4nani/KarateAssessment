package org.absa.verify;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class EmployeeTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:org/absa/verify/employee/Employee.feature").tags("@functional")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
