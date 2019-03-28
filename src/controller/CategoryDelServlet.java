package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.CategoryBO;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CategoryDelServlet
 */
public class CategoryDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDelServlet() {
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
				response.getWriter().append("Served at: ").append(request.getContextPath());
				CategoryBO dvBo= new CategoryBO();
				String mtl= request.getParameter("mtl");
				try {
					dvBo.deletect(mtl);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("CategoryGetListServlet");
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
