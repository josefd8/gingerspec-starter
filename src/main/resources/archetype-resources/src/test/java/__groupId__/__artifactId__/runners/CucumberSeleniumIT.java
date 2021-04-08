package ${groupId}.${artifactId}.runners;

import io.cucumber.testng.CucumberOptions;
import ${groupId}.${artifactId}.utils.BaseTest;


/**
 * This is an example on how to call an specific feature to be executed.
 * Glue files can be specified in the {@link CucumberOptions} annotation
 *
 * Notice that this class contains an special constructor. This constructor
 * is necessary if you want to execute your selenium features against a selenium
 * Gird/Node. For more information on how to do this, check the instructions here:
 * https://github.com/vpTechOSS/gingerspec/wiki/Running-Selenium-tests
 *
 */
@CucumberOptions(plugin = {
                "json:target/CucumberSeleniumIT.json",
                "html:target/CucumberSeleniumIT.html",
                "junit:target/CucumberSeleniumIT.xml"
        }, features =
        {
                "src/test/resources/features"
        },
        glue = "classpath:${groupId}.${artifactId}.glue")
public class CucumberSeleniumIT extends BaseTest {


}
