package com.base;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bean.DeviceInfo;
import com.dao.SyslogDao;

public class BaseDao{
    protected Session session=null;
    
    public BaseDao()
    {
    	
    }
    
	private SessionFactory sessionFactory; 
	
	/*
	private static Configuration configuration = null;
    private static ServiceRegistry serviceRegistry = null;
    */
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/*
	private ApplicationContext ctx; 

    public SessionFactory getSessionFactory() { 

        String[] configLocations = new String[] {"classpath:applicationContext.xml"}; 

        ctx = new ClassPathXmlApplicationContext(configLocations); 

        sessionFactory = ctx.getBean("sessionFactory", SessionFactory.class); 
        
        return sessionFactory;

    } */
    
    public Session getSession(){
    	if(sessionFactory==null){
    		session=this.getSessionFactory().getCurrentSession();
    		//session=this.getSessionFactory().openSession();
    	}else{
    		session=sessionFactory.getCurrentSession();
    		//session=sessionFactory.openSession();
    	}
    	return session;
    }
    
    
	public String getPath(Integer id) {
		if(id==null)
			return null;
		String path = null;
		List<DeviceInfo> list = this.getPathList(id);
		if(list!=null && list.size()>0){
			for(int i=list.size()-1; i>=0; i--){
				DeviceInfo d = list.get(i);
				if(d!=null){
					if(path==null)
						path = d.getName();
					else
						path += "-"+d.getName();
				}
			}
		}
		return path;
	}

	public List<DeviceInfo> getPathList(Integer id) {
		if(id==null)
			return null;
		session = this.getSession();
		DeviceInfo deviceInfo =  (DeviceInfo) session.get(DeviceInfo.class, id);
		if(deviceInfo==null)
			return null;
		List<DeviceInfo> list = new ArrayList<DeviceInfo>();
		while(deviceInfo!=null && deviceInfo.getPid()!=null && deviceInfo.getPid()>0){
			deviceInfo = (DeviceInfo) session.get(DeviceInfo.class, deviceInfo.getPid());
			if(deviceInfo!=null)
				list.add(deviceInfo);
			
		}
		return list;
	}
	
	public List<DeviceInfo> getChildrenPathList(Integer id) {
		if(id==null)
			return null;
		session = this.getSession();
		DeviceInfo deviceInfo =  (DeviceInfo) session.get(DeviceInfo.class, id);
		if(deviceInfo==null)
			return null;
		List<DeviceInfo> list = new ArrayList<DeviceInfo>();
		String ids = deviceInfo.getId().toString();
		
		while(true){
			String hql = " From DeviceInfo where pid in ( "+ids+" )";
			Query query  = session.createQuery(hql);
			List<DeviceInfo> listTemp = query.list();
			if(listTemp==null || listTemp.size()<1)
				break;
			for(DeviceInfo d : listTemp){
				list.add(d);
				ids += "," + d.getId();
			}
		}
		return list;
	}

}