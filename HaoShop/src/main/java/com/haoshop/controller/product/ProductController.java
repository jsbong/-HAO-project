package com.haoshop.controller.product;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haoshop.home.Pager;
import com.haoshop.model.payment.PaymentVO;
import com.haoshop.model.product.ProductService;
import com.haoshop.model.product.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	// 카테고리 품목 출력
	@RequestMapping("/category")
	public String getfbMirrorList(@RequestParam(defaultValue = "1") int curPage, ProductVO vo, Model model) { // 현재 페이지, 상품VO, 저장할 Model
		if(vo.getCate_no()%100000 == 0) {
			int count = productService.getCountProductAll(vo); // 서브 카테고리에 해당하는 상품 개수 리턴
			Pager pager = new Pager(count, curPage); // (레코드 개수, 현재 페이지 번호(default = 1) )
			int start = pager.getPageBegin(); //  
			int end = pager.getPageEnd(); // 
			
			List<ProductVO> list = productService.getProductListAll(start, end, vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cate_no", vo.getCate_no());
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			model.addAttribute("map", map);
		}else {
			int count = productService.getCountProduct(vo); // 서브 카테고리에 해당하는 상품 개수 리턴
			Pager pager = new Pager(count, curPage); // (레코드 개수, 현재 페이지 번호(default = 1) )
			int start = pager.getPageBegin(); //  
			int end = pager.getPageEnd(); // 
			
			List<ProductVO> list = productService.getProductList(start, end, vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cate_no", vo.getCate_no());
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			model.addAttribute("map", map);
		}
		return "product/category";
	}
	
	// 제품 상세페이지
	@RequestMapping("/productpage")
	public String productPage(ProductVO vo, Model model) {
		model.addAttribute("product", productService.productDetail(vo));
		return "product/productpage";
	}

	// 품목 리스트 + 페이징 + 검색
	@RequestMapping(value = "/searchPrd", method = RequestMethod.GET)
	public String listPage(Model model, HttpSession session, ProductVO vo,
			@RequestParam(defaultValue = "") String sPrd, @RequestParam(defaultValue = "1") int curPage) {
		// 게시글 갯수 계산
		int count = productService.countSearchPrd(sPrd);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		session.setAttribute("sPrd", sPrd); // 상품 이름 검색
		session.setAttribute("curPage", curPage);

		List<ProductVO> list = productService.listSearchPrd(sPrd, start, end); // 게시글 목록
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("sPrd", sPrd);
		model.addAttribute("map", map);

		return "product/search";
	}

	// 관리자
	

	// 상품등록 페이지
	@RequestMapping("/prdinsert")
	public String insertProductView(ProductVO vo) {
		return "admin/insertProduct";
	}

	// 상품등록
	@RequestMapping("/insertProduct")
	public String insertProduct(MultipartHttpServletRequest multi, ProductVO vo) throws FileNotFoundException {
		String root = "../HAO-project/HaoShop/src/main/webapp/";
		String path = "resources/img/product/" + vo.getCate_no() + "/";
		String realpath = root + "resources/img/product/" + vo.getCate_no() + "/";

		File dir = new File(realpath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		String P_img = "";
		List<MultipartFile> fileList = multi.getFiles("file");
		
		for (int i = 0; i < fileList.size(); i++) {
            String fileName = fileList.get(i).getOriginalFilename();
            P_img += path;	P_img += fileName;	P_img += "*";
        }
		vo.setP_img(P_img);
		productService.insertProduct(vo);
		return "main";
	}

	// 관리자- 상품 목록 뷰
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productListView(@RequestParam(defaultValue = "1") int curPage, ProductVO vo, Model model) {
		int count = productService.getAdminCountProduct(vo);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ProductVO> list = productService.getAdminProductList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/productList";
	}
	
	//관리자- 상품 수정 뷰
	@RequestMapping("/productDetail")
	public String productView(ProductVO vo, Model model) {
		model.addAttribute("product", productService.productDetail(vo));
		return "admin/productDetail";
	}
	
	//관리자- 상품 수정 처리
	@RequestMapping(value = "/updatePrd", method = RequestMethod.POST)
	public String changePrd(ProductVO vo) {
		productService.updatePrd(vo);
		return "admin/productList";
	}
	
	//관리자- 상품 삭제 처리
	@RequestMapping(value = "/deletePrd", method = RequestMethod.POST)
	public String deleteProduct(ProductVO vo) {
		productService.deletePrd(vo);
		return "admin/productList";
	}
}