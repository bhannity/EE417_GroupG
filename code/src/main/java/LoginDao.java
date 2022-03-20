//package form.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDao {
	
	String sql = "select * from user where username=? and password=?";
   String url = Common.getDatabaseUrlAndName();
   String username = Common.getDatabaseUser();
   String password = Common.getDatabasePassword();
	
	public boolean check(String uname, String psw) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection(url, username, password);
	    	PreparedStatement st = con.prepareStatement(sql);
	    	st.setString(1,  uname);
	    	st.setString(2, psw);
	    	ResultSet rs = st.executeQuery();
		if(rs.next()) {
			return true;
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
     return false;
 }
}