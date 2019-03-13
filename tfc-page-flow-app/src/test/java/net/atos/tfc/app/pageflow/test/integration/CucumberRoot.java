package net.atos.tfc.app.pageflow.test.integration;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
//@ActiveProfiles("INTEGRATION_TEST")
@ContextConfiguration(classes=Config.class)
public class CucumberRoot
{

}
