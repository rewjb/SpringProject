package com.itbank.springProject.joe.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	@Qualifier("AttractionsDAO")
	private AttractionsDAO attractionsDAO;
	
	
	@RequestMapping("joe/cartInsert")
	public String cartInsert(PlaceCartDTO placeCartDTO ,Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
//		System.out.println(placeCartDTO.getPid());
//		System.out.println(placeCartDTO.getMid());
		
		placeCartDAO.cartInsert(placeCartDTO);
		ArrayList<PlaceCartDTO> list = 	(ArrayList<PlaceCartDTO>)placeCartDAO.midSelect(placeCartDTO.getMid());
		ArrayList<AttractionsDTO> attList = new ArrayList<>();
		
		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				attList.add(attractionsDAO.select(list.get(i).getPid()));
			}
		}
		model.addAttribute("list", attList);
		
		return "joe/cartList";
	}
	
	
	@RequestMapping("joe/cartList")
	public String cartList(Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
//		System.out.println("리스트 보여줄라고 넘어왔니");
		ArrayList<PlaceCartDTO> list = (ArrayList)placeCartDAO.selectAll();
		ArrayList<AttractionsDTO> attList = new ArrayList<>();
		
		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				attList.add(attractionsDAO.select(list.get(i).getPid()));
			}
		}
		model.addAttribute("list", attList);
		return "joe/cartList";
	}
	@RequestMapping("joe/midCartList")
	public String midCartList(PlaceCartDTO placeCartDTO,Model model ,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
		ArrayList<PlaceCartDTO> list = 	(ArrayList<PlaceCartDTO>)placeCartDAO.midSelect(placeCartDTO.getMid());
		ArrayList<AttractionsDTO> attList = new ArrayList<>();
		
		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				attList.add(attractionsDAO.select(list.get(i).getPid()));
			}
		}
		model.addAttribute("list", attList);
		
		return "joe/cartList";
	}
	
	@RequestMapping("joe/midCart")
	@ResponseBody
	public List<PlaceCartDTO> midCart(PlaceCartDTO placeCartDTO,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		return placeCartDAO.midSelect(placeCartDTO.getMid());
	}
	
	
	
	
	@RequestMapping("joe/cartDelete")
	public String cartDelete(PlaceCartDTO placeCartDTO ,Model model,HttpServletResponse response) {
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");


//		System.out.println(placeCartDTO.getPid());
		
		
		placeCartDAO.delete(placeCartDTO);
		
		ArrayList<PlaceCartDTO> list = (ArrayList<PlaceCartDTO>)placeCartDAO.midSelect(placeCartDTO.getMid());
		ArrayList<AttractionsDTO> attList = new ArrayList<>();
//		System.out.println("list" + list.size());
		
		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				attList.add(attractionsDAO.select(list.get(i).getPid()));
			}
		}
		model.addAttribute("list", attList);
//		System.out.println(attList.size());
		
		return "joe/cartList";
	}
	
	
	@RequestMapping("joe/crawling")
	public String crawling() throws Exception {
		System.out.println("넘어왔니 크롤링");
		
		  Document doc = Jsoup.connect("http://www.tourtips.com/dest/main/").timeout(0).get();

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
	         element2 = element.get(i).select("a");
	         for (int j = 0; j < element2.size(); j++) {
	            doc2 = Jsoup.connect("http://www.tourtips.com" + element2.get(j).attr("href")).timeout(0).get();
	            element3 = doc2.select("div.popular_box a.more_info");
	            doc3 = Jsoup.connect("http://www.tourtips.com" + element3.get(0).attr("href")).timeout(0).get();
	            element4 = doc3.select("div.paging a");
	            temp = new String[1];
	            for (int j2 = 0; j2 < 1; j2++) {
	               temp[j2] = "http://www.tourtips.com" + element4.get(j2).attr("href");
	            }
	            
	            for (int k = 0; k < temp.length; k++) {
	               doc4 = Jsoup.connect(temp[k]).timeout(0).get();
	               element5 = doc4.select("div.spot_list li");

	               for (int y = 0; y < element5.size(); y++) {
	                     jo = (JSONObject)startJson.parse((jsonResult(element5.get(y).select("a").attr("href")
	                           ,element5.get(y).select("div.thumb_wrap div.thumb div.in div.thumb_img img")
	                           .attr("src"),
	                     element5.get(y).select("div.info strong.title").text(),
	                     element5.get(y).select("div.info p"),
	                     element5.get(y).select("a").attr("href"), element.get(i).select("h1").text(),
	                     element2.get(j).text(),element5.get(y).select("div.category").text())).toString());
	                     
	                     
	                     if(!((String)jo.get("길찾기")).equals("")) {
	                        
	                        dto.setContinent((String)jo.get("대륙"));
	                        dto.setCity((String)jo.get("도시"));
	                        dto.setPid((String)jo.get("고유아이디"));
	                        dto.setMainImg(jo.get("메인이미지").toString().split("/")[4] + ".jpg");
	                        dto.setTitle((String)jo.get("명소이름"));
	                        dto.setContent((String)jo.get("명소설명"));
	                        dto.setContentElements((String)jo.get("명소상세설명"));
	                        dto.setFindWay((String)jo.get("길찾기"));
	                        dto.setLatitude((String)jo.get("좌표(위도)"));
	                        dto.setLongitude((String)jo.get("좌표(경도)"));
	                        dto.setCategory((String)jo.get("태그"));
	                        
	                     
//	                        if ( imageSave(jo.get("메인이미지").toString(),jo.get("메인이미지").toString().split("/")[4])==0) {
//	                        	attractionsDAO.insert(dto);
//							}
	                        
	                        System.out.println(dto.getContinent());
	                        System.out.println(dto.getCity());
	                        System.out.println(dto.getPid());
	                        System.out.println(dto.getMainImg());
	                        System.out.println(dto.getTitle());
	                        System.out.println(dto.getContent());
	                        System.out.println(dto.getContentElements());
	                        System.out.println(dto.getFindWay());
	                        System.out.println(dto.getLatitude());
	                        System.out.println(dto.getLongitude());
	                        System.out.println(dto.getCategory());
	                        System.out.println(jo.get("메인이미지").toString());
	                        System.out.println();
	                        System.out.println("-------------------------------------------------------------");
	                        System.out.println();
	                        
	                     }//길찾기 값이 존재할때만 db저장 및 이미지저장
	               }
	            }
	         }
	      }
		return null;
	}
	
	 public StringBuffer jsonResult(String id,String elementsFisrt, String title, Elements content, String element, String continent,
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
	      if (!content.equals("")) {
	      buffer.append("\"명소설명\":" + "\"" + content.select("p").text().replaceAll(content.select("p.star").text(), "")+ "\",\n");
	  	}
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
	
	 private int imageSave(String source, String fileName) {
		 int check = 0;
         File outputFile = new File("C:\\Users\\user\\git\\SpringProject\\finalProject\\src\\main\\webapp\\resources\\IMAGE\\attractionsImg\\"+fileName+".jpg");
         try {
        	if (outputFile.isFile()) {
				check +=1;
			}else{
            URL url = new URL(source);            // 이미지 소스를 url에 넣기
            BufferedImage imgBuffer = ImageIO.read(url);
            // 해당  소스를 읽어오기
            ImageIO.write(imgBuffer, "jpg", outputFile);
			}

         } catch (Exception e) {
            e.printStackTrace();
         }
         	return check;
      }   // imageSave() : 메서드 종료
	
}
