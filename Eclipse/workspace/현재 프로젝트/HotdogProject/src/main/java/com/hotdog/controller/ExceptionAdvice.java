package com.hotdog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import com.hotdog.controller.HotdogErr;

@ControllerAdvice
public class ExceptionAdvice {
	
	@ExceptionHandler( value = {HotdogErr.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected String ajaxException2(HotdogErr exception, WebRequest request, HttpSession session) throws UnsupportedEncodingException{
		String view = exception.getMsg();
		String aMsg = exception.getTitle();
        String resultData = URLEncoder.encode(exception.getMsg(), "UTF-8");
        String alertMsg = URLEncoder.encode(exception.getTitle(), "UTF-8");
        session.setAttribute("err", aMsg);
        System.out.println(resultData);
        return view;
    }
}
