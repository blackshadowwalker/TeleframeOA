package com.listener;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.base.Config;


public class ContextListener implements ServletContextListener {

	Logger logger = null;
	private Map<String, Integer> actionMap = new HashMap<String, Integer>();
	Config config = new Config(); 
	
	public ContextListener(){
		logger= Logger.getLogger(ContextListener.class);
	}

	public void contextInitialized(ServletContextEvent event) {

		ServletContext sc = event.getServletContext();

		config.setTitle(sc.getInitParameter("title"));
		sc.setAttribute("config", config);
		System.out.println("=========  ContextListener  ===========");
		Enumeration pars = sc.getInitParameterNames();
		while(pars.hasMoreElements()){
			String name = (String)pars.nextElement();
			String value = sc.getInitParameter(name);
			System.out.println(name+"="+value);
			sc.setAttribute(name, value);
		}
		String IgnoreAction = sc.getInitParameter("IgnoreAction");
		String acs[] = IgnoreAction.split(",");
		for(int i=0; i<acs.length; i++ ){
			actionMap.put(acs[i].trim(), 1);
		}
		sc.setAttribute("actionMap", actionMap);

		/*
		ApplicationContext ctx = new ClassPathXmlApplicationContext("../applicationContext.xml");  
		DataSource ds = (DataSource)ctx.getBean("dataSource");  
		sc.setAttribute("basedb", ds);
		 */
	}


	public void contextDestroyed(ServletContextEvent arg0) {

	}

}
