package common;

import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class NoDupliFileName {

	public String noDupliFileName(MultipartFile mf) {
		System.out.println(":::noDupliFileName");
		UUID uuid = UUID.randomUUID();
		int pos = mf.getOriginalFilename().lastIndexOf(".");
		String ext = mf.getOriginalFilename().substring(pos + 1);
		return uuid + "." + ext;
	}

}
