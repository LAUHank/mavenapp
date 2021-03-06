package cn.lhl.mysql;

import cn.lhl.util.CloseUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class JDBCTest {
	
	private static Connection conn;
	static {
		ReadCfgUtil cfg = new ReadCfgUtil("jdbc.properties", "utf-8");
		String driver = cfg.getValue("jdbc.driver");
		String url = cfg.getValue("jdbc.url");
		String username = cfg.getValue("jdbc.username");
		String password = cfg.getValue("jdbc.password");
		try {
			Class.forName(driver);
			
			/*
			 * 创建连接是一个高开销的动作
			 * 关闭也一样
			 */
			conn = DriverManager.getConnection(url, username, password);
			
			System.out.println("数据库连接成功");
		} catch (Exception e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		
	}

	public static void main(String[] args) {
		testDQL();
	}
	
	public static void test() throws Exception {
		PreparedStatement pstmt = conn.prepareStatement("select * from student");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			System.out.println(id + ", "+name);
		}
		rs.close();
		pstmt.close();
	}
	
	public static void test2() throws Exception {
		PreparedStatement pstmt = conn.prepareStatement("insert into student (id,name) values(?,?);");
		pstmt.setInt(1, 5);
		pstmt.setString(2, "测试类3");
		pstmt.executeUpdate();
		pstmt.close();
		System.out.println("done");
	}

	public static void testDQL() {
		//conn单例化，注意不要再close了
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			System.out.println(conn);
			StringBuffer sb = new StringBuffer();
			sb.append("select id,name from test_table;");
			stmt = conn.prepareStatement(sb.toString());
			rs = stmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				System.out.println(id+"\t\t|"+name);
				System.out.println("==================================");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
		}
	}

	public static void testDML() {
		PreparedStatement stmt = null;
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("insert into test_table ");
			sb.append("(id, name) ");
			sb.append("values (3, 'lhl3') ;");
			stmt = conn.prepareStatement(sb.toString());
			int res = stmt.executeUpdate();
			System.out.println("影响表记录条数:"+res);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(stmt);
		}
	}

}
