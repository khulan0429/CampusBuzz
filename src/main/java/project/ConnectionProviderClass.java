package project;
import java.sql.*;

public class ConnectionProviderClass {

    public static Connection getCon() {
        Connection connection = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CampusBuzz","root","hulan$0429");
            return con;
        } catch (Exception e) {
            System.out.print(e);
            return null;
        }
    }
}
