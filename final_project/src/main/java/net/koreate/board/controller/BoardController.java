package net.koreate.board.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.board.service.BoardService;
import net.koreate.board.util.Criteria;
import net.koreate.board.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pm", service.getPageMaker(cri));
	}
	
	@GetMapping("/register")
	public String register() throws Exception {
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) throws Exception {
		String fileName = null;
		MultipartFile uploadFile = board.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		board.setFileName(fileName);
		String result = service.register(board);
		rttr.addFlashAttribute("result", result);
		return "redirect:/board/list";
	}
	
	// 상세보기
	@GetMapping({"/detail", "modify"})
	public void detailOrModify(@RequestParam("bno") int bno,
			@ModelAttribute("cri") Criteria cri,
			Model model) throws Exception {
		model.addAttribute("board",service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		String result = service.modify(board);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("result", result);
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		String result = service.delete(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("result", result);
		return "redirect:/board/list";
	}
}
