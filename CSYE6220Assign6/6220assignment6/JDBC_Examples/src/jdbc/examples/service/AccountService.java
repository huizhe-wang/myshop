package jdbc.examples.service;

import jdbc.examples.dao.AccountDAO;
import jdbc.examples.dao.HSQLDBAccountDAO;
import jdbc.examples.dao.JavaDBAccountDAO;
import jdbc.examples.dao.MySQLAccountDAO;
import jdbc.examples.vo.Account;

/**
 * Service layer for Account
 */
public class AccountService {
	
	public enum DatabaseType {HSQLDB, JAVADB, MYSQL;
		public AccountDAO getAccountDAO(){
			switch(this){
				case HSQLDB: return new HSQLDBAccountDAO();
				case JAVADB: return new JavaDBAccountDAO();
				case MYSQL: return new MySQLAccountDAO();
				default:
					return null;
			}
		}
	
	};
	AccountDAO accountDAO;
	
	/**
	 * Get an instance of the AccountService
	 * @param databaseType type of the database
	 */
	public AccountService(DatabaseType databaseType){
		accountDAO = databaseType.getAccountDAO();
	}

	/**
	 * Create a new account
	 * 
	 * @param account
	 *            account to be created
	 * @return created account
	 */
	public Account createAccount(Account account) {
		return accountDAO.createAccount(account);
	}

	/**
	 * Update an account
	 * 
	 * @param account
	 *            account to be created
	 */
	public void updateAccount(Account account) {
		accountDAO.updateAccount(account);
	}

	/**
	 * Retrieve an account
	 * 
	 * @param accountId
	 *            identifier of the account to be retrieved
	 * @return account represented by the identifier provided
	 */
	public Account getAccount(long accountId) {
		return accountDAO.getAccount(accountId);
	}

	/**
	 * Delete account
	 * 
	 * @param account
	 *            account to be deleted
	 */
	public void deleteAccount(Account account) {
		accountDAO.deleteAccount(account);
	}
}
