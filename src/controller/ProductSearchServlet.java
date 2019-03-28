package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.ProductsBO;

/**
 * Servlet implementation class ProductSearchServlet
 */
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("name");
		String tk = request.getParameter("tk");
		String typeId = request.getParameter("id_type");
		ProductsBO pr = new ProductsBO();
		CategoryBO ct = new CategoryBO();
		ArrayList<Category> lstC;
		ArrayList<Products> lstP;
		// get tất cả sản phẩm
		try {
			lstC = ct.getListM();
			lstP = pr.getAllProDucts();
			// nếu tìm kiếm
			if(tk !=null) {
				lstP = pr.getSearch(search);
				//System.out.println(search);
				}
			//nếu chọn loại
			if(typeId !=null) {
				lstP = pr.getProductsById(typeId);
			}
			/*if(productId !=null)
				lstP = pr.get1Products(productId);*/
			request.setAttribute("lstProducts", lstP);
			request.setAttribute("lstCategory", lstC);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("pages/shop-page.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
