package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Cart;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CustomerLoginServlet
 */
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		RequestDispatcher rd = request.getRequestDispatcher("pages/login.jsp");
		rd.forward(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		CustomerBO dnbo = new CustomerBO();			
		if(dnbo.checkLogin(tenDangNhap, matKhau)){
			if(dnbo.checkRole(tenDangNhap)) {
				HttpSession session = request.getSession();
				session.setAttribute("tenDangNhap", tenDangNhap);
				session.setAttribute("matKhau", matKhau);
				RequestDispatcher rd = request.getRequestDispatcher("admin/pages/home/index.jsp");
				rd.forward(request, response);
			}else {
			HttpSession session = request.getSession();
			session.setAttribute("tenDangNhap", tenDangNhap);
			String userName = dnbo.getName(tenDangNhap);
			session.setAttribute("userName", userName);
			int id = dnbo.getID(tenDangNhap, matKhau);
			session.setAttribute("idUser", id);
			response.sendRedirect("Index");
			}
		} else {
			request.setAttribute("thongBao", "Dang nhap that bai!");
			RequestDispatcher rd = request.getRequestDispatcher("pages/login.jsp");
			rd.forward(request, response);
		}
	}

}
