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
 * Servlet implementation class EditPassWordCustomer
 */
public class EditPassWordCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPassWordCustomer() {
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
		String edit = request.getParameter("edit");
		String customer = request.getParameter("user-name");
		CustomerBO khbo = new CustomerBO();
		if(edit != null) {
			HttpSession session = request.getSession();
			String checkMatKhau = (String) session.getAttribute("matKhau");
			String pass=request.getParameter("password");
			System.out.println(pass+checkMatKhau+customer+"kk");
			if(checkMatKhau.equals(pass) ) {
				
				Customer kh = khbo.getCustomerById(customer);
				request.setAttribute("customer", kh);
				request.setAttribute("thongBao", "Mật khẩu trùng với mật khẩu cũ!!!");
				RequestDispatcher rd = request.getRequestDispatcher("pages/user-profile.jsp");
				rd.forward(request, response);
			}else {
			
			//khbo.(customer, pass);
			session.invalidate(); 
	        response.sendRedirect("index.jsp");
			//response.sendRedirect("DanhSachKhanhHangServlet");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		}
	}


