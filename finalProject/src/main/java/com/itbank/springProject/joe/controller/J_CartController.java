package com.itbank.springProject.joe.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;

import javax.imageio.ImageIO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.springProject.db.AttractionsDAO;
import com.itbank.springProject.db.AttractionsDTO;
import com.itbank.springProject.db.PlaceCartDAO;
import com.itbank.springProject.db.PlaceCartDTO;


@Controller
public class J_CartController {


	@Autowired
	@Qualifier("PlaceCartDAO")
	private PlaceCartDAO placeCartDAO;
	
	@Autowired
	@Qualifier("attractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	
	@RequestMapping("joe/cartInsert")
	public String cartInsert(PlaceCartDTO placeCartDTO ,Model model) {
		System.out.println("넘어옴");
		System.out.println(placeCartDTO.getPid());
		System.out.println(placeCartDTO.getMid());
		
		placeCartDAO.cartInsert(placeCartDTO);
		model.addAttribute("dto", attractionsDAO.select(placeCartDTO.getPid()));
		return "joe/j_cart";
	}
	
	@RequestMapping("joe/crawling")
	public String crawling() throws Exception {
		System.out.println("넘어왔니 크롤링");
		
		  Document doc = Jsoup.connect("http://www.tourtips.com/dest/main/").get();

	      Document doc2 = null;

	      Document doc3 = null;

	      Document doc4 = null;

	      Elements element = doc.select("div.cityList");

	      Elements element2 = null;

	      Elements element3 = null;

	      Elements element4 = null;

	      Elements element5 = null;

	      String[] temp = null;
	      
	      JSONObject jo;
	      
	      JSONParser startJson = new JSONParser();

	      AttractionsDTO dto = new AttractionsDTO();
	      
	      
	      // System.out.println(element.size());

	      for (int i = 0; i < element.size(); i++) {
	         // System.out.println(element.get(i).select("h1").text());
	         element2 = element.get(i).select("a");
	         for (int j = 0; j < element2.size(); j++) {
	            // System.out.println(element2.get(j).text());
	            // System.out.println("http://www.tourtips.com" +
	            // element2.get(j).attr("href"));
	            doc2 = Jsoup.connect("http://www.tourtips.com" + element2.get(j).attr("href")).get();

	            element3 = doc2.select("div.popular_box a.more_info");

	            // System.out.println(element3.get(0).attr("href"));

	            doc3 = Jsoup.connect("http://www.tourtips.com" + element3.get(0).attr("href")).get();

	            element4 = doc3.select("div.paging a");
	            // System.out.println(element4.size());

	            temp = new String[1];
	            for (int j2 = 0; j2 < 1; j2++) {
	               temp[j2] = "http://www.tourtips.com" + element4.get(j2).attr("href");
	            }
//	            for (int j2 = 0; j2 < temp.length; j2++) {
//	               System.out.println(temp[j2]);
//	            }

	            
	            for (int k = 0; k < temp.length; k++) {
//	               System.out.println(temp[0]);
	               doc4 = Jsoup.connect(temp[k]).get();
	               element5 = doc4.select("div.spot_list li");
//	               System.out.println(element5);

	               for (int y = 0; y < element5.size(); y++) {
//	                  System.out.println("넘어오니??");
	                     jo = (JSONObject)startJson.parse((jsonResult(element5.get(y).select("a").attr("href")
	                           ,element5.get(y).select("div.thumb_wrap div.thumb div.in div.thumb_img img")
	                           .attr("src"),
	                     element5.get(y).select("div.info strong.title").text(),
	                     element5.get(y).select("div.info p").text(),
	                     element5.get(y).select("a").attr("href"), element.get(i).select("h1").text(),
	                     element2.get(j).text(),element5.get(y).select("div.category").text())).toString());
	                     
	                     
	                     if(!((String)jo.get("길찾기")).equals("")) {
	                        
	                        dto.setContinent((String)jo.get("대륙"));
	                        dto.setCity((String)jo.get("도시"));
	                        dto.setId((String)jo.get("고유아이디"));
	                        dto.setMainImg(jo.get("메인이미지").toString().split("/")[4] + ".jpg");
	                        dto.setTitle((String)jo.get("명소이름"));
	                        dto.setContent((String)jo.get("명소설명"));
	                        dto.setContentElements((String)jo.get("명소상세설명"));
	                        dto.setFindWay((String)jo.get("길찾기"));
	                        dto.setLatitude((String)jo.get("좌표(위도)"));
	                        dto.setLongitude((String)jo.get("좌표(경도)"));
	                        dto.setCategory((String)jo.get("태그"));
	                        
	                        attractionsDAO.insert(dto);
	                        
	                        System.out.println(dto.getContinent());
	                        System.out.println(dto.getCity());
	                        System.out.println(dto.getId());
	                        System.out.println(dto.getMainImg());
	                        System.out.println(dto.getTitle());
	                        System.out.println(dto.getContent());
	                        System.out.println(dto.getContentElements());
	                        System.out.println(dto.getFindWay());
	                        System.out.println(dto.getLatitude());
	                        System.out.println(dto.getLongitude());
	                        System.out.println(dto.getCategory());
	                        
	                        
	                        System.out.println(jo.get("메인이미지").toString());
	                        
	                        
	                        imageSave(jo.get("메인이미지").toString(),jo.get("메인이미지").toString().split("/")[4]);
	                     }//길찾기 값이 존재할때만 db저장 및 이미지저장

	               }
	            }
	         }
	      }
		return null;
	}
	
	 public StringBuffer jsonResult(String id,String elementsFisrt, String title, String content, String element, String continent,
	         String city,String category) throws Exception {
	      
	      StringBuffer buffer = new StringBuffer();
	      
	      Document document = Jsoup.connect("http://www.tourtips.com" + element).get();
	      Elements nameElements = document.select("div.cnt_info");
	      Elements contentElements = document.select("div.cnt_reason");
	      
	      buffer.append("{\n");
	      buffer.append("\"대륙\":" + "\"" + continent + "\",\n");
	      buffer.append("\"도시\":" + "\"" + city + "\",\n");
	      if (id != "") {
	         buffer.append("\"고유아이디\":" + "\"" + id.split("=")[1].split("&")[0] + "\",\n");
	      }else{
	         buffer.append("\"고유아이디\":" + "\"" + id + "\",\n");
	      }
	      buffer.append("\"메인이미지\":" + "\"" + elementsFisrt + "\",\n");
	      buffer.append("\"명소이름\":" + "\"" + title + "\",\n");
	      buffer.append("\"명소설명\":" + "\"" + content + "\",\n");
	      buffer.append("\"명소상세설명\":" + "\"" + contentElements.text().replaceAll("\"", "") + "\",\n");
	      buffer.append("\"길찾기\":" + "\"" + nameElements.select("li.howto a").attr("href") + "\",\n");
	      if (nameElements.select("li.howto a").attr("href") != "") {
	         buffer.append("\"좌표(위도)\":" + "\"" + nameElements.select("li.howto a").attr("href").split("=")[2].split(",")[0] + "\",\n");
	         buffer.append("\"좌표(경도)\":" + "\"" + nameElements.select("li.howto a").attr("href").split("=")[2].split(",")[1] + "\"\n");
	      }else{
	         buffer.append("\"좌표(위도)\":" + "\"" + nameElements.select("li.howto a").attr("href") + "\",\n");
	         buffer.append("\"좌표(경도)\":" + "\"" + nameElements.select("li.howto a").attr("href") + "\"\n");
	      }
	      buffer.append("\"태그\":" + "\"" + category + "\",\n");
	      buffer.append("}\n");

	      return buffer;
	   }
	
	 private void imageSave(String source, String fileName) {
         
         File outputFile = new File("C:\\Users\\user\\git\\SpringProject\\finalProject\\src\\main\\webapp\\resources\\IMAGE\\attractionsImg\\"+fileName+".jpg");
         try {
        	
            URL url = new URL(source);            // 이미지 소스를 url에 넣기
            BufferedImage imgBuffer = ImageIO.read(url);
            // 해당  소스를 읽어오기
            ImageIO.write(imgBuffer, "jpg", outputFile);
            

         } catch (Exception e) {
            e.printStackTrace();
         }

      }   // imageSave() : 메서드 종료
	
}
