package fakestore.api;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.Collection;
import java.util.LinkedList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class E2ERunner {

    private static final String fs = File.separator;
    private static final String projectName = "E2E Runner";
    private static final String target = "target/cucumber-reports" + fs + projectName;
    public static Collection<File> jsonFiles = new LinkedList();
    String[] tags = {"@E2E"};

    @Test
    @Order(1)
    public void testUsers() {
        String testName = new Exception().getStackTrace()[0].getMethodName();
        Results result = Runner.path("classpath:fakestore/api/postusers/PostUsers.feature")
                .reportDir(target + fs + testName)
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(1);
        jsonFiles.addAll(FileUtils.listFiles(new File(result.getReportDir()), new String[]{"json"}, true));
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
    @Test
    @Order(2)
    public void testLogin() {
        String testName = new Exception().getStackTrace()[0].getMethodName();
        Results result = Runner.path("classpath:fakestore/api/postauthlogin/PostAuthlogin.feature")
                .reportDir(target + fs + testName)
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(1);
        jsonFiles.addAll(FileUtils.listFiles(new File(result.getReportDir()), new String[]{"json"}, true));
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
    @Test
    @Order(3)
    public void testGetProducts() {
        String testName = new Exception().getStackTrace()[0].getMethodName();
        Results result = Runner.path("classpath:fakestore/api/getproducts/Getproducts.feature")
                .reportDir(target + fs + testName)
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(1);
        jsonFiles.addAll(FileUtils.listFiles(new File(result.getReportDir()), new String[]{"json"}, true));
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
    @Test
    @Order(4)
    public void testGetProductsId() {
        String testName = new Exception().getStackTrace()[0].getMethodName();
        Results result = Runner.path("classpath:fakestore/api/getproductsid/GetproductsId.feature")
                .reportDir(target + fs + testName)
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(1);
        jsonFiles.addAll(FileUtils.listFiles(new File(result.getReportDir()), new String[]{"json"}, true));
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
    @Test
    @Order(5)
    public void testGetCarts() {
        String testName = new Exception().getStackTrace()[0].getMethodName();
        Results result = Runner.path("classpath:fakestore/api/getcarsuser/GetCarsUser.feature")
                .reportDir(target + fs + testName)
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(1);
        jsonFiles.addAll(FileUtils.listFiles(new File(result.getReportDir()), new String[]{"json"}, true));
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
}

