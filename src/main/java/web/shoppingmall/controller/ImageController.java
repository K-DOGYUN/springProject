package web.shoppingmall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import net.coobird.thumbnailator.Thumbnailator;
import web.shoppingmall.domain.ImageDTO;

@Controller
public class ImageController {

	private String getFolderName() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	private boolean checkImage(File file) {
		try {
			String type = Files.probeContentType(file.toPath());
			return type.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@PostMapping(value = "/imageUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ImageDTO>> imageUpload(MultipartFile[] uploadImage) throws Exception {
		List<ImageDTO> list = new ArrayList<ImageDTO>();

		// make uploadPath
		String imagePath = getFolderName();// imagePath
		File imageFolderPath = new File("C:\\upload", imagePath);
		System.out.println("uploadPath : " + imageFolderPath);
		if (!imageFolderPath.exists()) {
			imageFolderPath.mkdirs();// make yyyy/MM/dd folder
		}

		for (MultipartFile mpf : uploadImage) {
			ImageDTO imageDto = new ImageDTO();

			String imageName = mpf.getOriginalFilename();// imageName
			String imageUUID = UUID.randomUUID().toString(); // imageUUID

			File saveImage = new File(imageFolderPath, imageUUID + "_" + imageName);

			if (!checkImage(saveImage)) {
				System.out.println("적절하지 않은 확장자 입니다.");
				throw new Exception("적절하지 않은 확장자 입니다.");
			}

			System.out.println(imageName);
			System.out.println(imagePath);
			System.out.println(imageUUID);
			System.out.println(mpf.getSize());

			imageDto.setImg_name(imageName);
			imageDto.setImg_path(imagePath);
			imageDto.setImg_UUID(imageUUID);

			try {
				mpf.transferTo(saveImage);
				FileOutputStream thumbnail = new FileOutputStream(
						new File(imageFolderPath, "s_" + imageUUID + "_" + imageName));
				Thumbnailator.createThumbnail(mpf.getInputStream(), thumbnail, 200, 200);
				thumbnail.close();
				list.add(imageDto);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@GetMapping("/showImage")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(String path) {
		System.out.println("path : " + path);
		File file = new File("c:\\upload\\" + path);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/imageDelete")
	@ResponseBody
	public ResponseEntity<String> imageDelete(String path) {
		System.out.println("deletePath : " + path);
		File file;
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(path, "UTF-8"));
			file.delete();
			file = new File("C:\\upload\\" + URLDecoder.decode(path, "UTF-8").replace("s_", ""));
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@PostMapping(value = "/imageArrayUpload")
	@ResponseBody
	public String imageArrayUpload(ImageDTO imageDTO) {
		System.out.println("imageArrayUpload");
		System.out.println(imageDTO);
		return "success";
	}
}
