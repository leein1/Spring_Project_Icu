package kr.liw.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.liw.domain.PhotoBoardImageVO;
import kr.liw.mapper.PhotoBoardImageMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_ = @Autowired)
	private PhotoBoardImageMapper imageMapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron = "0 35 15 * * *")
	public void checkFiles() throws Exception{
		log.warn("FileCheck Task run..........");
		log.warn("============================");
		
		//file list in database
		List<PhotoBoardImageVO> fileList = imageMapper.getOldFiles();
		
		//ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("/Users/leeinwon/SpringUpload",
				vo.getPath(),vo.getUuid() + "_" + vo.getName())).collect(Collectors.toList());
		
		//image file has thumnail file
		fileList.stream().filter(vo -> vo.getType().equals("true")).map(vo -> Paths.get("/Users/leeinwon/SpringUpload",
				vo.getPath(), "s_" + vo.getUuid() + "_" + vo.getName())).forEach(p -> fileListPaths.add(p));
		
		log.warn("============================");
		fileListPaths.forEach(p -> log.warn(p));
		
		//files in yesterday directory
		File targetDir = Paths.get("/Users/leeinwon/SpringUpload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("============================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
}
