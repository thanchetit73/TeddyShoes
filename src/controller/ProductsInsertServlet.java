package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.CustomerBO;
import model.bo.ProductsBO;

/**
 * Servlet implementation class ProductsInsertServlet
 */
public class ProductsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsInsertServlet() {
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
		ProductsBO pr = new ProductsBO();
		CategoryBO ct = new CategoryBO();
		ArrayList<Category> lstC = null;
		if(request.getParameter("them")!=null) {
			String nameProduct = request.getParameter("name");
			String typeId = request.getParameter("typeId");
			String uPrice = request.getParameter("unitPrice");
			int unitPrice =Integer.parseInt(uPrice);

			String prPrice = request.getParameter("promotionPrice");
			int promotionPrice=Integer.parseInt(prPrice);
			String image = request.getParameter("image");
			String description = request.getParameter("description");
			String unit = request.getParameter("unit");
			String nProduct = request.getParameter("newProduct");
			int newProduct = Integer.parseInt(nProduct);
			Products pd = new Products(nameProduct, typeId, unitPrice, promotionPrice, image, unit, newProduct, description);
			try {	
				pr.insertProducts(pd);
//				request.setAttribute("ktthem", String.valueOf(i));	
				System.out.println();
				
				
			}
			 catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
			try {
				lstC = ct.getListM();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("lstCategory", lstC);
		RequestDispatcher rd= request.getRequestDispatcher("admin/pages/product/add.jsp");
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
