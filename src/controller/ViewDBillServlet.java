package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.ViewDBillBO;

public class ViewDBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewDBillServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	ViewDBillBO bd = new ViewDBillBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("Home");
			return;
		}			
		request.setCharacterEncoding("utf-8");
		int i = Integer.parseInt(request.getParameter("bill_Id"));
		try {
			
			request.setAttribute("lstViewdb", bd.get1HD(i));		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("admin/pages/bill/viewdetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
