package com.netcruz.iims.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.netcruz.iims.service.LibraryBoardService;
import com.netcruz.iims.vo.LibraryBoardVo;

@Controller("libraryBoardController")
@RequestMapping("/libraryBoard")
public class LibraryBoardController {
	@Autowired
    private FileSystemResource fsResource;
	@Autowired
	@Qualifier("libraryBoardService")
	LibraryBoardService libraryBoardService;

	public LibraryBoardController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/libraryboardlist.do")
	public String libraryBoardList() throws Exception{
		System.out.println("/libraryboardlist.do");
		return "tem.jsp?nextPage=libraryboardlist";
	}
	
	@RequestMapping("/afterlibraryboardlist.do")
	public @ResponseBody JSONArray afterLibraryBoardList() throws Exception{
		System.out.println("/afterlibraryboardlist.do");
		JSONArray ja = JSONArray.fromObject(libraryBoardService.getLibraryBoardList());
		
		for(int i=0; i < ja.size() ; i++){
			JSONObject obj = ja.getJSONObject(i);
			obj.discard("fileData");
		}
		System.out.println("[debug]    json..." + ja);
		return ja;
	}
	
	@RequestMapping("/insertlibraryboard.do")
	public String insertLibraryBoard(LibraryBoardVo libraryBoardVo)  throws Exception {
		System.out.println("/insertlibraryboard.do");
		System.out.println("libraryBoardVo : " + libraryBoardVo);
		
		if(! libraryBoardVo.getFileData().isEmpty()){
			String filename = libraryBoardVo.getFileData().getOriginalFilename();
			System.out.println("filename : "+filename);
			libraryBoardVo.setFile(filename);
			String imgExt = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			if (imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("GIF")) {

                byte[] bytes = libraryBoardVo.getFileData().getBytes();

                try {
                     File outFileName = new File(fsResource.getPath() + filename);
                     FileOutputStream fileoutputStream = new FileOutputStream(outFileName);
                     fileoutputStream.write(bytes);
                     fileoutputStream.close();
                } catch (IOException ie) {
                     System.err.println("File writing error! ");
                }
                System.err.println("File upload success! ");
           } else {
                System.err.println("File type error! ");
           }
		}

		libraryBoardService.insertLibraryBoard(libraryBoardVo);
		return "redirect:/libraryBoard/libraryboardlist.do";
	}
	
	@RequestMapping("/deletelibraryboard.do")
	public String deleteLibraryBoard(LibraryBoardVo libraryBoardVo) throws Exception{
		System.out.println("/deletelibraryboard.do");
		System.out.println("libraryBoardVo : " + libraryBoardVo);
		libraryBoardService.deleteLibraryBoard(libraryBoardVo.getId());
		
		return "redirect:/libraryBoard/libraryboardlist.do";
	}
	
	@RequestMapping("/updatelibraryboard.do")
	public String updateLibraryBoard(LibraryBoardVo libraryBoardVo) throws Exception{
		
		try{
			libraryBoardVo.setCategory(new String(libraryBoardVo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
			libraryBoardVo.setContents(new String(libraryBoardVo.getContents().getBytes("ISO-8859-1"), "euc-kr"));
			libraryBoardVo.setNote(new String(libraryBoardVo.getNote().getBytes("ISO-8859-1"), "euc-kr"));
			libraryBoardVo.setRegDate(new String(libraryBoardVo.getRegDate().getBytes("ISO-8859-1"), "euc-kr"));
			libraryBoardVo.setTitle(new String(libraryBoardVo.getTitle().getBytes("ISO-8859-1"), "euc-kr"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("/updatelibraryboard.do");
		System.out.println("libraryBoardVo : " + libraryBoardVo);
		libraryBoardService.updateLibraryBoard(libraryBoardVo);
		return "redirect:/libraryBoard/libraryboardlist.do"; 
	}
	
	@RequestMapping(value = "/fileDown.do", method = RequestMethod.GET)
    public ModelAndView fileDown(@RequestParam("file") String file) {
		System.out.println("/fileDown.do");
        System.out.println("file명 : " + file);
		String fullPath = "C:/fileupload/" + file ;
        File downloadFile = new File(fullPath);
       
        return new ModelAndView("download", "downloadFile", downloadFile);
    }


}
