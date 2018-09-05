package com.java.web;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.dao.DaoInterface;
import com.java.eis.MRBean;
import com.java.eis.OlympicMapper;
import com.java.eis.OlympicReducer;
import com.java.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MRController {
	
	@Autowired
	DaoInterface di;
	
	@Resource(name="hdConf")
	Configuration conf;
	
	String inputFile = "/csv";
	HashMap<String, Object> resultMap;
	List<HashMap<String, Object>> resultList;
	public static String choice1;
	public static String selectM;
	public static String selectA;
	public static String selectC;
	public static String selectY;
	
	@RequestMapping("/dir")
	public void dir(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String choice = req.getParameter("choice");
		resultList = new ArrayList<HashMap<String,Object>>();
		getDir(inputFile);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", resultList);
		result.put("resultMap", choice);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json;charset=utf-8");
		JSONObject json = JSONObject.fromObject(JSONSerializer.toJSON(result));
		try {
			res.getWriter().write(json.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public FileStatus[] getStatus(String newPath) throws IOException {
		URI uri = URI.create(newPath);
		Path path = new Path(uri);
		FileSystem file = FileSystem.get(uri, conf);
		return file.listStatus(path);
	}
	
	public void getDir(String newPath) throws IOException {
		FileStatus[] dirList = getStatus(newPath);
		for(int i = 0; i < dirList.length; i++) {
			String name = dirList[i].getPath().getName();
			if(dirList[i].isDirectory()) {
				getDir(newPath + "/" + name);
			} else {
				resultMap = new HashMap<String, Object>();
//				resultMap.put("path", newPath + "/" + name);
				resultMap.put("key", name);
				if("summer.csv".equals(name)){
					resultMap.put("type", "하계올림픽");
				}else {
					resultMap.put("type", "동계올림픽");
				}
				resultList.add(resultMap);
			}
		}
	}
	
	@RequestMapping("/click")
	public void click(HttpServletRequest req, HttpServletResponse res) throws Exception{
		String choiceDir = req.getParameter("choice");
		OlympicDir(choiceDir);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json;charset=utf-8");
		JSONObject json = JSONObject.fromObject(JSONSerializer.toJSON(resultMap));
		res.getWriter().write(json.toString());
		
	}
	
	public ModelAndView OlympicDir(String choiceDir) throws IOException {
		resultMap = new HashMap<String, Object>();
		resultMap.put("choiceDir", choiceDir);
		HashMap<String, Object> selectY = new HashMap<String, Object>();
		HashMap<String, Object> selectC = new HashMap<String, Object>();
		HashMap<String, Object> selectA = new HashMap<String, Object>();
		HashMap<String, Object> selectM = new HashMap<String, Object>();
		if(choiceDir.equals("summer.csv")) {
			
			selectY.put("sqlType", "view.selectSY");
			selectY.put("sql", "selectList");
			List Ylist = (List) di.call(selectY);
			resultMap.put("Ylist", Ylist);
			
			selectC.put("sqlType", "view.selectSC");
			selectC.put("sql", "selectList");
			List Clist = (List) di.call(selectC);
			resultMap.put("Clist", Clist);
			
			selectA.put("sqlType", "view.selectSA");
			selectA.put("sql", "selectList");
			List Alist = (List) di.call(selectA);
			resultMap.put("Alist", Alist);
			
			selectM.put("sqlType", "view.selectSM");
			selectM.put("sql", "selectList");
			List Mlist = (List) di.call(selectM);
			resultMap.put("Mlist", Mlist);
			
			return HttpUtil.makeJsonView(resultMap);
			
			
		}else if(choiceDir.equals("winter.csv")) {
			selectY.put("sqlType", "view.selectWY");
			selectY.put("sql", "selectList");
			List Ylist = (List) di.call(selectY);
			resultMap.put("Ylist", Ylist);
			
			selectC.put("sqlType", "view.selectWC");
			selectC.put("sql", "selectList");
			List Clist = (List) di.call(selectC);
			resultMap.put("Clist", Clist);
			
			selectA.put("sqlType", "view.selectWA");
			selectA.put("sql", "selectList");
			List Alist = (List) di.call(selectA);
			resultMap.put("Alist", Alist);
			
			selectM.put("sqlType", "view.selectWM");
			selectM.put("sql", "selectList");
			List Mlist = (List) di.call(selectM);
			resultMap.put("Mlist", Mlist);
			
			return HttpUtil.makeJsonView(resultMap);
		}
		return null;
	}
	
	
	@RequestMapping("/cm")
	public void cm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String choice = req.getParameter("choice");
		System.out.println(choice);
		choice1 = req.getParameter("choice1");
		selectY = req.getParameter("selectY");
		selectA = req.getParameter("selectA");
		selectC = req.getParameter("selectC");
		selectM = req.getParameter("selectM");
		System.out.println(selectY);
		System.out.println(selectA);
		System.out.println(selectC);
		System.out.println(selectM);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		System.out.println("start");
		
		String inDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		String inTime = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
		String outTime = inDate + inTime;
		
		String saveDir = "/result/" + outTime;
		
		Job job = Job.getInstance(conf, "sm");
		FileInputFormat.addInputPath(job, new Path("/csv/" + choice));
		FileOutputFormat.setOutputPath(job, new Path(saveDir));
		
		job.setJarByClass(this.getClass());
		job.setMapperClass(OlympicMapper.class);
		job.setReducerClass(OlympicReducer.class);
		
		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		job.waitForCompletion(true);
		
		resultMap.put("saveDir", saveDir);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json;charset=utf-8");
		JSONObject json = JSONObject.fromObject(JSONSerializer.toJSON(resultMap));
		res.getWriter().write(json.toString());
		
		System.out.println("end");

	}
	@RequestMapping("/drawing")
	public void drawing(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String chart = req.getParameter("chart").toString()+"/part-r-00000";
		URI uri = URI.create(chart);
        Path path = new Path(uri);
        FileSystem file = FileSystem.get(uri, conf);
        FSDataInputStream fsIs = file.open(path);
        System.out.println(1);
        
		byte[] buffer = new byte[5000];
		int byteRead = 0;
		String result = "";
		while((byteRead = fsIs.read(buffer)) > 0) { 
			result = new String(buffer, 0, byteRead);
		}
		String[] rows = result.split("\n");
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for(int j = 0; j < rows.length; j++) {
			String row = rows[j];
			String[] cols = row.split("\t");
			HashMap<String, Object> map = new HashMap<String, Object>();
			for(int c = 0; c < cols.length; c++) {
				map.put(c + "", cols[c]);
			}
			list.add(map);
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultList", list);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json;charset=utf-8");
		JSONObject json = JSONObject.fromObject(JSONSerializer.toJSON(resultMap));
		res.getWriter().write(json.toString());
	}
	
}
