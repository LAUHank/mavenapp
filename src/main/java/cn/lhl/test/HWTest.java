package cn.lhl.test;

import cn.lhl.mysql.DbcpTest;
import cn.lhl.mysql.JDBCTest;

/**
 * 入口类
 * Created by lhl on 2018/3/29.
 */
public class HWTest {
    public static void main(String[] args) {
    	/*
    	    <!-- java -jar maven_app-jar-with-dependencies.jar -->
	        <!-- java -jar maven_app-jar-with-dependencies.jar jdbc -->
	        <!-- java -jar maven_app-jar-with-dependencies.jar dbcp -->
    	 */
        int i = 0;
        for (String arg : args) {
        	if (i == 0) {
        		System.out.println("您的第一个输入参数为:"+arg);
        		switch (arg) {
        		case "jdbc" : 
        			System.out.println("jdbc方式连库");
        			try {
        				JDBCTest.test();
        			} catch (Exception e) {
        				e.printStackTrace();
        			}
        			break;
        		case "dbcp" : 
        			System.out.println("dbcp方式连库");
        			try {
        				DbcpTest.test();
        			} catch (Exception e) {
        				e.printStackTrace();
        			}
        			break;
        		}
        	}
        	i++;
        }
        System.out.println("hello world");
    }
}
