package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import utils.Helper;

/**
 *
 * @author AnhDT
 */
public class SQLServerConnection {

    public static final String HOSTNAME = "localhost";
    public static final String PORT = "1433";

    /**
     * Get connection to MSSQL Server
     * @return Connection
     */
    public static Connection getConnection() {
        Properties properties = Helper.getPropertiesByFileName("const/const.properties");
        // Create a variable for the connection string.
        String connectionUrl = "jdbc:sqlserver://"+HOSTNAME+":"+PORT+";"
                             + "databaseName="+properties.getProperty("database.name") + ";encrypt=true;trustServerCertificate=true"; 

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(connectionUrl, properties.getProperty("database.username"), properties.getProperty("database.password"));
        }
        // Handle any errors that may have occurred.
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
