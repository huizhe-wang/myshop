package csye6220.assignment6.account;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="account")

public class account {
	
	@Id
	@GenericGenerator(name = "idGenerator", strategy = "native")
	@GeneratedValue(generator = "idGenerator")
	@Column(length = 20)
	
	private Integer ID;

	private String URL;
	private String TITLE;
	private String LINK;

	public account() {

	}

	public account(Integer id, String url, String title, String link) {
		this.ID = id;
		this.URL = url;
		this.TITLE = title;
		this.LINK = link;
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer id) {
		ID = id;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String url) {
		URL = url;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String title) {
		TITLE = title;
	}

	public String getLINK() {
		return LINK;
	}

	public void setLINK(String link) {
		LINK = link;
	}
	
}
