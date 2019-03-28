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
 * Servlet implementation class StatisticalPriceServlet
 */
public class StatisticalPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticalPriceServlet() {
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
		String thongKeTGia = request.getParameter("thongketheogia");
		String tuGia = request.getParameter("tugia");
		String denGia = request.getParameter("dengia");
		BillBO billBO = new BillBO();
		
		if(thongKeTGia != null) {
			ArrayList<Statistical> listThongKeTheoGia = null;
			try {
				listThongKeTheoGia = billBO.getThongKeGiaTien(tuGia, denGia);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		    request.setAttribute("listThongKeTheoGia", listThongKeTheoGia);
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/thongketheogiatien.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("admin/pages/thongke/thongketheogiatien.jsp");
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
