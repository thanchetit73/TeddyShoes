package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.CategoryBO;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CategoryInsertServlet
 */
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryInsertServlet() {
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
		if("submit".equals(request.getParameter("submit"))) {
			String mtl = request.getParameter("ml");
			String ttl = request.getParameter("tl");
			try {
				CategoryBO.inserCategory(mtl, ttl);;
				response.sendRedirect("ACategoryServlet");
			} catch ( SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\category\\add.jsp");
			rd.forward(request, response);
		}
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
