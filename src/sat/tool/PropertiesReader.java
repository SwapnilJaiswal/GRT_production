package sat.tool;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
//import org.apache.log4j.Logger;

public class PropertiesReader  {
//    private static final Logger logger = eLogger.getLogger(PropertiesReader.class);
    private static String defaultPropertiesFile = "/grt.properties";
    
    /**
     * Reads the default property file "grt.properties",
     * and creates a <code>Properties</code> object around it.
     * @return <code>Properties</code> object containing properties from the default property file.
     */
    public static Properties readProperties(){
        return readProperties(defaultPropertiesFile);
    }
    
    /**
     * Reads the given property file and creates a <code>Properties</code> object around it.
     * @param propertyFile The property file to be read.
     * @return <code>Properties</code> object containing properties from <code>propertyFile</code>.
     */
    public static Properties readProperties(String propertyFile) {
        System.out.println("readProperties2 "+propertyFile);
        Properties props = new Properties();
        try {
        	props.load(new FileInputStream("C:/grt.properties"));
           // props.load(PropertiesReader.class.getResourceAsStream("/grt.properties"));
            //props.load(getServletContext().getResourceAsStream("/WEB-INF/classes/grt.properties"));
//            props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream(propertyFile));
        } catch (IOException ioException) {
        	System.out.println(ioException.getMessage());
        	ioException.printStackTrace();
//            logger.error("IOException while loading properties file "+propertyFile+" ", ioException);
        }
        return props;
        
    }
}
