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
import model.bo.BlogsBO;
import model.bo.CustomerBO;
import model.bo.ProductsBO;

/**
 * Servlet implementation class Home
 */
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().append("Served at: ").append(request.getContextPath());
				
				HttpSession session = request.getSession();
				String checkRole = (String) session.getAttribute("tenDangNhap");
				BlogsBO blog = new BlogsBO();
				ProductsBO sp = new ProductsBO();
				ArrayList<Products> ds;
				String typeId =request.getParameter("typeId");
				CustomerBO dnbo = new CustomerBO();
				if(checkRole != null){
				if(dnbo.checkRole(checkRole)) {					
					RequestDispatcher rd = request.getRequestDispatcher("admin/pages/home/index.jsp");
					rd.forward(request, response);
				}else {
					try {
						ds = sp.getAllProDucts();
						if(typeId!=null)
							ds = sp.getProductsById(typeId);
						request.setAttribute("blog", blog.getListBlogs());
						request.setAttribute("lstProducts", ds);	
						request.setAttribute("typeId", typeId);	
						request.setAttribute("blog", blog.getListBlogs());
						RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				}else {
					try {
						ds = sp.getAllProDucts();
						if(typeId!=null)
							ds = sp.getProductsById(typeId);
						request.setAttribute("blog", blog.getListBlogs());
						request.setAttribute("lstProducts", ds);	
						request.setAttribute("typeId", typeId);	
						request.setAttribute("blog", blog.getListBlogs());
						RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
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
