package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.BillBO;

/**
 * Servlet implementation class StatisticalServlet
 */
public class StatisticalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("Home");
			return;
		}			
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String thongKe = request.getParameter("thongke");
		String tuNgay = request.getParameter("tungay");
		String denNgay = request.getParameter("denngay");
		BillBO billBO = new BillBO();
		int total = 0;
		if(thongKe != null) {
			try {
				total = billBO.getTotal(tuNgay, denNgay);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String s = String.valueOf(total);
			request.setAttribute("total", s);
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/khoangthoigian.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/khoangthoigian.jsp");
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
