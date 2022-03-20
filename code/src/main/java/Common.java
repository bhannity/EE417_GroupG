

public class Common {

   private static String DatabaseUrl = "jdbc:mysql://localhost/";
   private static String DatabaseName = "library";
   private static String DatabaseUser = "root";
   private static String DatabasePw = "";

   public static String getDatabaseUrl(){
      return DatabaseUrl;
   }
   
   public static String getDatabaseName(){
      return DatabaseName;
   }
   
   public static String getDatabaseUser(){
      return DatabaseUser;
   }
   
   public static String getDatabasePassword(){
      return DatabasePw;
   }
   
   public static String getDatabaseUrlAndName(){
      return DatabaseUrl + DatabaseName;
   }
   
   public static void setDatabaseUrl(String newUrl){
      DatabaseUrl = newUrl;
   }
   
   public static void setDatabaseName(String newDbName){
      DatabaseName = newDbName;
   }
   
   public static void setDatabaseUser(String newUser){
      DatabaseUser = newUser;
   }
   
   public static void setDatabasePassword(String newPassword){
      DatabasePw = newPassword;
   }
   
}
