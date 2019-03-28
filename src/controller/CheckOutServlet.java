/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Bill;
import model.bean.BillDetail;
import model.bean.Cart;
import model.bean.Customer;
import model.bean.Item;
import model.dao.BillDAO;
import model.dao.BillDetailDAO;

public class CheckOutServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	BillDAO billDAO = new BillDAO();
    	BillDetailDAO billDetailDAO = new BillDetailDAO();
    	String Checkout = request.getParameter("Checkout");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String users = (String) session.getAttribute("idUser");
      //  long userName = Long.parseLong(users);
        
        Customer cus = new Customer();
        cus.setUserName(users);
        if(Checkout != null) {
        try {      	
            Bill bill = new Bill();
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(users);
            bill.setDate(new Date());
            bill.setTotal(cart.totalCart());
            System.out.println(cart.totalCart()+"hh");
            System.out.println(users+"hh");
            billDAO.insertBill(bill);
            int billID = billDAO.getBillID(bill);
            System.out.println(cart.totalCart()+"kk");
            for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {
                billDetailDAO.insertBillDetail(new BillDetail(billID, list.getValue().getProduct().getProductId(),
                		list.getValue().getProduct().getUnitPrice(),
                		list.getValue().getQuantity()));
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
            response.sendRedirect("Index");
          //  System.out.println("ok");
        } catch (Exception e) {
        	e.printStackTrace();
        }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }

}
