package cn.lhl.util;

/**
 * 释放资源的工具类
 * @author lhl
 *
 */
public class CloseUtil {
    public static void close(AutoCloseable closeObj) {
        if (closeObj != null) {
            try {
                closeObj.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}