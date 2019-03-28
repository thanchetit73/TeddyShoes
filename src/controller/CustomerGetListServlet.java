package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Customer;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CustomerGetListServlet
 */
public class CustomerGetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerGetListServlet() {
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
				response.getWriter().append("Served at: ").append(request.getContextPath());
				String tenKhachHang = request.getParameter("tenKhachHang");
				CustomerBO khbo = new CustomerBO();
				if(tenKhachHang != null ) {
					Customer kh = khbo.getAdmin(tenKhachHang);
					request.setAttribute("admin", kh);
					RequestDispatcher rd = request.getRequestDispatcher("admin/pages/profile/profile.jsp");
					rd.forward(request, response);
				}else {
				ArrayList<Customer> listKhachHang =null;  
					listKhachHang=khbo.getListCustomer();
				request.setAttribute("listKhachHang", listKhachHang);
				RequestDispatcher rd = request.getRequestDispatcher("admin/pages/user/list.jsp");
				rd.forward(request, response);
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
