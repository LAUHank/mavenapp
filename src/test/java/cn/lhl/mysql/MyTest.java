package cn.lhl.mysql;

import org.junit.Test;

public class MyTest {
	@Test
	public void test() {
		try {
			//JDBCTest.test();
			DbcpTest.test();
			System.out.println("hello");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
