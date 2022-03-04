package net.koreate.board.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import net.koreate.board.util.FileUtils;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.WishVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	ServletContext context;
	
	@Inject
	BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pm", service.getPageMaker(cri));
		model.addAttribute("ltt",cri.getTradeType());
		model.addAttribute("lct",cri.getCategory());
		System.out.println(model);
	}
	
	@GetMapping("/register")
	public String register() throws Exception {
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String register(
			BoardVO board,
			RedirectAttributes rttr,
			HttpServletRequest request) throws Exception {
		String uploadFolder = context.getRealPath("/resources/img");
		System.out.println("폴더경로:"+uploadFolder);
		String fileName = null;
		MultipartFile uploadFile = board.getUploadFile();
		System.out.println(board);
		UUID uuid = UUID.randomUUID();
		if (!uploadFile.isEmpty()) {
			fileName = uuid+"_"+uploadFile.getOriginalFilename();
			File saveFile = new File(uploadFolder, fileName);
			uploadFile.transferTo(saveFile);
		}
		board.setFileName(fileName);
		board.setFilePath(uploadFolder);
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
	
	@PostMapping("/addWishlist")
	public String addWishlist(BoardVO board, int bno, RedirectAttributes rttr) throws Exception {
		String result = service.addWishlist(board);
		rttr.addFlashAttribute("result", result);
		return "redirect:/board/detail?bno="+bno;
	}
	
	@PostMapping("/removeWishlist")
	public String removeWishlist(BoardVO board, int bno, RedirectAttributes rttr) throws Exception {
		String result = service.removeWishlist(board);
		rttr.addFlashAttribute("result", result);
		return "redirect:/board/detail?bno="+bno;
	}
	
}
