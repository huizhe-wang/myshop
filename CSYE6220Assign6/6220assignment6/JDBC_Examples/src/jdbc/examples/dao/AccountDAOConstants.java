package jdbc.examples.dao;

public class AccountDAOConstants {

	public static String UPDATE_ACCOUNT = "UPDATE ACCOUNT SET ACCOUNT_TYPE = ?, BALANCE = ? WHERE ACCOUNT_ID = ?";

	public static String DELETE_ACCOUNT = "DELETE FROM ACCOUNT WHERE ACCOUNT_ID = ?";

	public static String GET_ACCOUNT = "SELECT * FROM ACCOUNT WHERE ACCOUNT_ID = ?";

}
