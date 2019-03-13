package com.itbank.springProject.kim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.Page;
import com.google.cloud.vision.v1.Paragraph;
import com.google.cloud.vision.v1.Symbol;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.Word;
import com.google.common.collect.Lists;
import com.google.protobuf.ByteString;

public class VisionMethod {
	
	public String name() {
		String path = this.getClass().getResource("").getPath();
		System.out.println(path);
		return path;
	}
		
		public HashMap<String, String> imgTag() throws Exception {
			
			String path = "C:/Users/user/git/SpringProject2/finalProject/src/main/webapp/";
			File file = new File(path + "resources/IMAGE/attractionsImg");
			String[] imgs = file.list();
						
			HashMap<String, String> tagList = new HashMap<>();
			
			for(int i = 0; i < imgs.length; i++){
				
				System.out.println(i + "번째 사진 판독 중..");
				String tags = "";
				String img = "resources/IMAGE/attractionsImg/" + imgs[i];
				ArrayList<String> list = detectLabels(path + img);
				
				for(int j = 0; j < list.size(); j++){
					if(j == 0) {
						tags += list.get(j);
					}else{					
						tags += "/" + list.get(j);
					}
				}
				System.out.println(tags);
				tagList.put(imgs[i].substring(0, imgs[i].indexOf(".")), tags);
				
			}
			return tagList;			
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
	
	static void authExplicit(String jsonPath) throws IOException {
		  // You can specify a credential file by providing a path to GoogleCredentials.
		  // Otherwise credentials are read from the GOOGLE_APPLICATION_CREDENTIALS environment variable.
		  GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(jsonPath))
		        .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
		  Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();

		  System.out.println("Buckets:");
		  com.google.api.gax.paging.Page<Bucket> buckets = storage.list();
		  for (Bucket bucket : buckets.iterateAll()) {
		    System.out.println(bucket.toString());
		  }
		}

	private static Image getImage(String filePath) throws IOException {
        Image image;

        if (filePath.startsWith("gs://")) { // GCS에서 이미지를 가져올때 image 생성
            ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
            image = Image.newBuilder().setSource(imgSource).build();
        }
        else { // 로컬에서 이미지를 가져올때 image 생성
            ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
            image = Image.newBuilder().setContent(imgBytes).build();
        }

        return image;
    }

	
	private static void detectText(String filePath) throws Exception {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = getImage(filePath);

	    Feature feature = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {
	            if (res.hasError()) {
	                System.out.println("Error: " + res.getError().getMessage());
	                return;
	            }

	            // For full list of available annotations, see http://g.co/cloud/vision/docs
	            for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
	                System.out.println("Text: " + annotation.getDescription());
	                System.out.println("Position : " + annotation.getBoundingPoly());
	            }
	        }
	    }
	}
	
	
	public static void detectDocumentText(String filePath) throws Exception {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = getImage(filePath);

	    Feature feature = Feature.newBuilder().setType(Feature.Type.DOCUMENT_TEXT_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();
	        client.close();

	        for (AnnotateImageResponse res : responses) {
	            if (res.hasError()) {
	                System.out.println("Error: " + res.getError().getMessage());
	                return;
	            }

	            // For full list of available annotations, see http://g.co/cloud/vision/docs
	            TextAnnotation annotation = res.getFullTextAnnotation();
	            for (Page page: annotation.getPagesList()) {
	                String pageText = "";

	                for (Block block : page.getBlocksList()) {
	                    String blockText = "";
	                    for (Paragraph para : block.getParagraphsList()) {
	                        String paraText = "";
	                        for (Word word: para.getWordsList()) {
	                            String wordText = "";
	                            for (Symbol symbol: word.getSymbolsList()) {
	                                wordText = wordText + symbol.getText();
	                            }
	                            paraText = paraText + wordText;
	                        }
	                        // Output Example using Paragraph:
	                        System.out.println("Paragraph: \n" + paraText);
	                        System.out.println("Bounds: \n" + para.getBoundingBox() + "\n");
	                        blockText = blockText + paraText;
	                    }
	                    pageText = pageText + blockText;
	                }
	            }

	            System.out.println(annotation.getText());
	        }
	    }
	}
	
	
	public static String detectLandmarks(String filePath) throws Exception {
        
		String name = "";
		List<AnnotateImageRequest> requests = new ArrayList<>();
        
        Image image = getImage(filePath);

        Feature feature = Feature.newBuilder().setType(Feature.Type.LANDMARK_DETECTION).build();
        AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
        requests.add(request);

        try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
            BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
            List<AnnotateImageResponse> responses = response.getResponsesList();

            for (AnnotateImageResponse res : responses) {
                if (res.hasError()) {
                    System.out.println("Error: " + res.getError().getMessage());
                    return null;
                }

                // For full list of available annotations, see http://g.co/cloud/vision/docs
                for (EntityAnnotation annotation : res.getLandmarkAnnotationsList()) {
                    LocationInfo info = annotation.getLocationsList().listIterator().next();
                    //System.out.println("Landmark: " + annotation.getDescription() + "\n" + "LatLng: " + info.getLatLng());
                    name = annotation.getDescription();
                }
            }
        }
        return name.equals("") ? "결과 없음" : name;
    }
	
	
	public static ArrayList<String> detectLabels(String filePath) throws Exception {
		
		ArrayList<String> list = new ArrayList<>();
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = getImage(filePath);

	    Feature feature = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {
	            if (res.hasError()) {
	                System.out.println("Error: " + res.getError().getMessage());
	                return null;
	            }

	            // For full list of available annotations, see http://g.co/cloud/vision/docs
	            for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
	                //annotation.getAllFields().forEach((k, v) -> System.out.println(k + " : " + v.toString()));
	            	Iterator<Object> iter = annotation.getAllFields().values().iterator();
	            	
	            	for(int i = 0; iter.hasNext(); i++){
	            		String text = "" + iter.next();
	            		if(i == 1){
	            			list.add(text);
	            		}
	            	}	                
	            }	            
	        }
	    }
	    return list;
	}



}
