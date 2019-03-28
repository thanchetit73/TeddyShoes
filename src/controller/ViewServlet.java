package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.ViewBO;
import model.dao.BillDAO;


public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	BillDAO vb = new BillDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("Home");
			return;
		}			
		//view
		try {	
			request.setAttribute("lstView", vb.getListBill());
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		
		RequestDispatcher rd = request.getRequestDispatcher("admin/pages/bill/list.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
