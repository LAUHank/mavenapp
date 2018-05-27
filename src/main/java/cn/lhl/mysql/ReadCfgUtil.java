package cn.lhl.mysql;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class ReadCfgUtil {

	private Properties p = new Properties();
	
	public ReadCfgUtil(String cfgPath, String encode) {
		try {
			InputStream in = ReadCfgUtil.class.getClassLoader().getResourceAsStream(cfgPath);
			p.load(new InputStreamReader(in, encode));
			in.close();
			System.out.println("配置文件["+cfgPath+"]加载成功");
		} catch (Exception e) {
			System.out.println("配置文件["+cfgPath+"]加载失败");
			e.printStackTrace();
		}
		
	}

	public String getValue(String key, String defVal) {
		return p.getProperty(key, defVal);
	}
	
	public String getValue(String key) {
		return getValue(key, "");
	}
}
