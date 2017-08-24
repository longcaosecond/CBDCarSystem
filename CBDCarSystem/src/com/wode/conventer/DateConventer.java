package com.wode.conventer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class DateConventer implements Converter<String, Date> {
	//<String, Date>:这是设置将String类型的数据转换为Date类型数据
	
	@Override
	public Date convert(String str) {
		Date date = null;
		//这里是设置满足"yyyy-MM-dd"这种格式的字符串就会转换为Date类型；
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

}
