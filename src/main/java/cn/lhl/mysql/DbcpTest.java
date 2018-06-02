package cn.lhl.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.lhl.util.CloseUtil;
import org.apache.commons.dbcp2.BasicDataSource;


public class DbcpTest {
	
	private static BasicDataSource ds;
	static {
		ReadCfgUtil cfg = new ReadCfgUtil("jdbc.properties", "utf-8");
		String driver = cfg.getValue("jdbc.driver");
		String url = cfg.getValue("jdbc.url");
		String username = cfg.getValue("jdbc.username");
		String password = cfg.getValue("jdbc.password");
		try {
			ds = new BasicDataSource();
			ds.setDriverClassName(driver);
			ds.setUrl(url);
			ds.setUsername(username);
			ds.setPassword(password);
			System.out.println("数据库连接池初始化成功");
			/*
			https://blog.csdn.net/a9529lty/article/details/43021801
			
			initialSize ：连接池启动时创建的初始化连接数量（默认值为0）
			
			maxActive ：连接池中可同时连接的最大的连接数（默认值为8，调整为20，高峰单机器在20并发左右，自己根据应用场景定）
			
			maxIdle：连接池中最大的空闲的连接数，超过的空闲连接将被释放，如果设置为负数表示不限制
			（默认为8个，maxIdle不能设置太小，因为假如在高负载的情况下，连接的打开时间比关闭的时间快，
			会引起连接池中idle的个数 上升超过maxIdle，而造成频繁的连接销毁和创建，类似于jvm参数中的Xmx设置)
			
			minIdle：连接池中最小的空闲的连接数，低于这个数量会被创建新的连接
			（默认为0，调整为5，该参数越接近maxIdle，性能越好，因为连接的创建和销毁，都是需要消耗资源的；
			但是不能太大，因为在机器很空闲的时候，也会创建低于minidle个数的连接，类似于jvm参数中的Xmn设置）
			
			maxWait  ：最大等待时间，当没有可用连接时，
			连接池等待连接释放的最大时间，超过该时间限制会抛出异常，如果设置-1表示无限等待（默认为无限，调整为60000ms，
			避免因线程池不够用，而导致请求被无限制挂起）
			
			removeAbandonedTimeout  ：超过时间限制，回收没有用(废弃)的连接（默认为 300秒，调整为180）
			
			removeAbandoned  ：超过removeAbandonedTimeout时间后，是否进 行没用连接（废弃）的回收（默认为false，调整为true)
			
			 */
		} catch (Exception e) {
			System.out.println("数据库连接池初始化失败");
			e.printStackTrace();
		}
		
	}

	public static void main(String[] args) {
		testDQL();
	}
	
	public static void test() throws Exception {
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select * from student");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			System.out.println(id + ", "+name);
		}
		rs.close();
		pstmt.close();
		conn.close();
	}
	
	public static void test2() throws Exception {
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("insert into student (id,name) values(?,?);");
		pstmt.setInt(1, 5);
		pstmt.setString(2, "测试类3");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		System.out.println("done");
	}

	public static void testDQL() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
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
			CloseUtil.close(conn);
		}
	}

	public static void testDML() {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = ds.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("insert into test_table ");
			sb.append("(id, name) ");
			sb.append("values (2, 'lhl2') ;");
			stmt = conn.prepareStatement(sb.toString());
			int res = stmt.executeUpdate();
			System.out.println("影响表记录条数:"+res);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
	}

}
