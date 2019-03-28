package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Customer;
import model.bo.CustomerBO;

/**
 * Servlet implementation class CustomerManageServlet
 */
public class CustomerManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerManageServlet() {
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
				String del = request.getParameter("del");
				String edit = request.getParameter("edit");
				String phanQuyen = request.getParameter("phanQuyen");
				
				CustomerBO khbo = new CustomerBO();
				if(del != null) {
					String tenKhachHang = request.getParameter("tenKhachHang");
					khbo.delCustomer(tenKhachHang);;
					response.sendRedirect("CustomerGetListServlet");
				}else if(edit != null) {
					HttpSession session = request.getSession();
					String checkMatKhau = (String) session.getAttribute("matKhau");
					String userName= request.getParameter("userName");;
					//String img =request.getParameter("img");;
					String showAdmin=request.getParameter("tenHienThi");;
					String pass=request.getParameter("matKhau");
					if(checkMatKhau.equals(pass) ) {
						String tenKhachHang = (String) session.getAttribute("tenDangNhap");
						Customer kh = khbo.getAdmin(tenKhachHang);
						request.setAttribute("admin", kh);
						request.setAttribute("thongBao", "Mật khẩu trùng với mật khẩu cũ!!!");
						RequestDispatcher rd = request.getRequestDispatcher("admin/pages/profile/profile.jsp");
						rd.forward(request, response);
					}else {
					
					khbo.suaAdmin(userName, showAdmin, pass);
					session.invalidate(); 
			        response.sendRedirect("index.jsp");
					//response.sendRedirect("DanhSachKhanhHangServlet");
					}
				}else if(phanQuyen != null) {
					String userName = request.getParameter("userName");
					khbo.addAdmin(userName);
					response.sendRedirect("CustomerGetListServlet");
				}
				else {
					response.sendRedirect("CustomerGetListServlet");
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
