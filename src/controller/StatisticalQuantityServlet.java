package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Statistical;
import model.bo.BillBO;

/**
 * Servlet implementation class StatisticalQuantityServlet
 */
public class StatisticalQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticalQuantityServlet() {
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
		String thongKeSL = request.getParameter("thongkesl");
		String tuNgay = request.getParameter("tungay");
		String denNgay = request.getParameter("denngay");
		BillBO billBO = new BillBO();
		
		if(thongKeSL != null) {
			ArrayList<Statistical> listThongKeSL = null;
			try {
				listThongKeSL = billBO.getThongKeSL(tuNgay, denNgay);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		    request.setAttribute("listThongKeSL", listThongKeSL);
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/thongketheosoluong.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/thongketheosoluong.jsp");
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
