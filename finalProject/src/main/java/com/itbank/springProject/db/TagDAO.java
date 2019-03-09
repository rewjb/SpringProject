package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

@Repository("TagDAO")
public class TagDAO {
	
	MongoClient mongoClient;
	DB db;
	
	public TagDAO() {
		try {
			
			mongoClient = new MongoClient("34.73.189.101",27017);
            System.out.println("접속 성공");
            //쓰기권한 부여
            WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
            mongoClient.setWriteConcern(w);
            //데이터베이스 연결
            db = mongoClient.getDB("tag");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
    public void mongoInsert(HashMap<String, String> list, Iterator<String> iter) {
            //컬렉션 가져오기
            DBCollection coll = db.getCollection("place");
            
    		int count = 1;
    		
    		while(iter.hasNext()){
    			String key = iter.next();
    			
    			//user 테이블에 데이터삽입
    			DBObject doc = new BasicDBObject();
    			doc.put(key,list.get(key));
    			coll.insert(doc);
    			System.out.println(count + ") " + key + " : " + list.get(key));
    			count++;
    		}
                    
            //모든 데이터 삭제
            //coll.remove(new BasicDBObject());
             
    }
    
    public void mongoInsert(String id, String tags) {
    		//컬렉션 가져오기
    		DBCollection coll = db.getCollection("member");
    		
    			//user 테이블에 데이터삽입
    			DBObject doc = new BasicDBObject();
    			doc.put("id", id);
    			doc.put("tag", tags);
    			coll.insert(doc);
    			System.out.println("인서트 결과 = " + id + " : " + tags);
    		
    	
    }
    
    public void mongoDelete(String id) {
            //컬렉션 가져오기
            DBCollection coll = db.getCollection("member");
            
            //데이터 선택 삭제
            coll.remove(new BasicDBObject("id", id)); //강감찬 삭제
            
    }
    
    public void mongoUpdate(HashMap<String, String> list, Iterator<String> iter) {
            //컬렉션 가져오기
            DBCollection coll = db.getCollection("place");
            
          //업데이트
          DBObject origin = new BasicDBObject("password123","바바바");
          DBObject set = new BasicDBObject("$set",new BasicDBObject("password123","ㅁㅁㅁ"));
          coll.update(origin, set);//앞이 조건 뒤에가 바뀌는 데이터
            
    }
    
    public String mongoSelect(String id) {
            //컬렉션 가져오기
            DBCollection coll = db.getCollection("member");
            
            //특정 조건에 맞는 데이터 출력
            DBObject o = new BasicDBObject();
            o.put("id", id);
            //o.put(key,"{$exists: true}");
            DBCursor cursor = (DBCursor) coll.find(o);
            String result = null;
            if(cursor.hasNext()){
            	String rs = cursor.next().toString();
            	String val = rs.toString().replaceAll("\"", "").replaceAll("}", "");
            	String val2 = val.substring(val.indexOf(",")+1).replaceAll(" ", "");
            	String[] valRs = val2.split(":");            	
            	result = valRs[2];
            }
 	  	
      	  	return result;
            
    }
    
    public HashMap<String, String> mongoSelectAll() {
    	HashMap<String, String> map = new HashMap<>();
    		//컬렉션 가져오기
    		DBCollection coll = db.getCollection("place");
    		    		
	            //user의 모든 데이터 가져오기
	          DBCursor cursor = coll.find();
	          while(cursor.hasNext()){
	              //커서의 이름중에 _id인 컬럼 값만 출력
	        	  String val = cursor.next().toString().replaceAll("\"", "").replaceAll("}", "");
	        	  String val2 = val.substring(val.indexOf(",")+1).replaceAll(" ", "");
	        	  String[] valRs = val2.split(":");
	              map.put(valRs[0] + ".jpg", valRs[1]);
	          }
    		
    	return map;
    }
    
	@SuppressWarnings("unchecked")
	public static List sortByValue(final Map map) {

        List<String> list = new ArrayList<>();
        list.addAll(map.keySet());
      
        Collections.sort(list,new Comparator() {
             
            public int compare(Object o1,Object o2) {
                Object v1 = map.get(o1);
                Object v2 = map.get(o2);
                 
                return ((Comparable) v2).compareTo(v1);
            }           
        });
        //Collections.reverse(list); // 주석시 오름차순
        return list;
    }

}
