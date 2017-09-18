package jdbc.examples.dao;

public class MySQLAccountDAOConstants {

	public static final String URL = "jdbc:mysql://localhost:3306/JDBC_EXAMPLES?user=root&password=06250812Whz";
	
	public static String CREATE_ACCOUNT = "INSERT INTO ACCOUNT(ACCOUNT_TYPE, CREATION_DATE, BALANCE) VALUES(?,CURRENT_TIMESTAMP,?)";

	public static String GET_ACCOUNT_ID = "SELECT LAST_INSERT_ID() FROM ACCOUNT";           

}
