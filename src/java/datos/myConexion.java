
package datos;


import java.sql.Connection;
import java.sql.DriverManager;




public class myConexion {
    
  static String url="jdbc:mysql://localhost:3306/queryprice";
static String user="root";
static String pw="";  
    public static Connection Conexion(){
                try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection(url,user,pw);
            return conn;
        } catch (Exception e) {
                return null;
        }
    }
    }
    




