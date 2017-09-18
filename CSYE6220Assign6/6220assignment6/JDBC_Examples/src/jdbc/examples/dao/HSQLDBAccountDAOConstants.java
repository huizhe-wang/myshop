package jdbc.examples.dao;

public class HSQLDBAccountDAOConstants {

	public static final String URL = "jdbc:hsqldb:hsql://localhost/JDBC_EXAMPLES";
	
	public static String CREATE_ACCOUNT = "INSERT INTO ACCOUNT(ACCOUNT_TYPE, CREATION_DATE, BALANCE) VALUES(?,CURRENT_TIMESTAMP,?)";

	public static String GET_ACCOUNT_ID = "SELECT IDENTITY() FROM ACCOUNT";           

}
