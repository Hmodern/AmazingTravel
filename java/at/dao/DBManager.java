package at.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {

	private Connection conn = null;
	private String host;
	private String userid;
	private String userpw;
	private ResultSet rs;
	private Statement stmt;

	public DBManager() {
		conn = null;
		userid = "root";
		userpw = "ezen";
		host = "jdbc:mysql://127.0.0.1:3306/at";
		host += "?useUnicode=true&characterEncoding=utf-8";
		host += "&serverTimezone=UTC";
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	// DB�� ����.
	// return���� true�� ���� ����,
	// false�� ���� ����.
	public boolean DBOpen() {
		// 1. jdbc ���̺귯�� �ε�
		// DB�� ����.
		// 2. �����ͺ��̽��� �����Ѵ�.

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}

		try {
			conn = DriverManager.getConnection(host, userid, "ezen");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// DB ���� ����.
	public void DBClose() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// CUD (INSERT, UPDATE, DELETE) ���� ����.

	public boolean RunCommand(String sql) {

		try {
			stmt = conn.createStatement();
			System.out.println(sql);
			stmt.executeUpdate(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return false;
		}
		return true;
	}

	// R (SELECT) ���� ����.
	public boolean RunSelect(String sql) {
		try {
			stmt = conn.createStatement();
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean GetNext() {
		try {
			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public String GetValue(String colname) {
		
		try {
			return rs.getString(colname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	//���� ����ǥ ��ȯ
	public String _R(String value) {
		
		return value.replace("'", "''");
	}

}
