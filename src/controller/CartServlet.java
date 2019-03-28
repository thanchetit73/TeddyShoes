/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Cart;
import model.bean.Item;
import model.bean.Products;
import model.dao.ProductsDAO;


public class CartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final ProductsDAO productDAO = new ProductsDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String command = request.getParameter("command");

		String productID = request.getParameter("productID");
		Cart cart = (Cart) session.getAttribute("cart");

		try {
			//Long idProduct = Long.parseLong(productID);
			Products product = productDAO.get1Products(productID);
			switch (command) {
			case "plus":
				if (cart.getCartItems().containsKey(productID)) {
					cart.plusToCart(productID, new Item(product, cart.getCartItems().get(productID).getQuantity()));
				} else {
					cart.plusToCart(productID, new Item(product, 1));
				}
				break;
			case "remove":
				cart.removeToCart(productID);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Home");
		}
		
		session.setAttribute("cart", cart);
		RequestDispatcher rd = request.getRequestDispatcher("Home");
		rd.forward(request, response);
	}

}
