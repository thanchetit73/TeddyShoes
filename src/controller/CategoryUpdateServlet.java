package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bo.CategoryBO;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CategoryUpdateServlet
 */
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryUpdateServlet() {
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
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("Home");
			return;
		}			
		String checkRole = (String) session.getAttribute("tenDangNhap");
		CustomerBO dnbo = new CustomerBO();
		if(checkRole != null){
		if(dnbo.checkRole(checkRole)) {
				String mtl = request.getParameter("mtl");
			
				if("submit".equals(request.getParameter("submit"))){
					
					String ttl = request.getParameter("ttl");
				
					try {
						
						CategoryBO.updateCategoryType(mtl, ttl);;
						response.sendRedirect("CategoryGetListServlet");
					} catch ( SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}else {
					try {
						
						Category mb = CategoryBO.get1CategoryType(mtl);
						request.setAttribute("mb", mb);
						RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\category\\edit.jsp");
						rd.forward(request, response);
					} catch (ClassNotFoundException  e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					
				}							
				}
		else {
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
