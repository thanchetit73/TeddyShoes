package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.CustomerBO;
import model.bo.ProductsBO;

/**
 * Servlet implementation class ProductsUpdateServlet
 */
public class ProductsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("Home");
			return;
		}			
		String checkRole = (String) session.getAttribute("tenDangNhap");
		CustomerBO dnbo = new CustomerBO();
		if(checkRole != null){
		if(dnbo.checkRole(checkRole)) {
		ProductsBO ds = new ProductsBO();
		CategoryBO ct = new CategoryBO();
		Products prd = null;
		String productId= request.getParameter("productId");				
		if(request.getParameter("sua")!=null) {
			ArrayList<Products> lstP = ds.getAllProDucts();
			request.setAttribute("lstProducts", lstP);
			String nameProduct = request.getParameter("nameProduct");
			String typeId = request.getParameter("typeId");
			String unitPrice = request.getParameter("unitPrice");
			String promotionPrice = request.getParameter("promotionPrice");
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			String unit = request.getParameter("unit");
			String newProduct = request.getParameter("newProduct");		
		try {		
			ds.updateProducts(productId, nameProduct, typeId, Integer.parseInt(unitPrice), Integer.parseInt(promotionPrice), image, unit, Integer.parseInt(newProduct), description);
			RequestDispatcher rd= request.getRequestDispatcher("ProductsGetListServlet");
			rd.forward(request, response);
		}
		 catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		}
		try {
			 prd = ds.get1Products(productId);
			request.setAttribute("lstCategory", ct.getListM() );
			request.setAttribute("get1Product",prd);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(prd.getProductId()+"hihi");
		RequestDispatcher rd= request.getRequestDispatcher("admin/pages/product/edit.jsp");
		rd.forward(request, response);
	}else {
		//code customer
		response.sendRedirect("Home");
		return;
	}
	
	}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
