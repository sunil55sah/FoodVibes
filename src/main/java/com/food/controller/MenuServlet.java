package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MenuDAO menuDAO;

	@Override
	public void init() throws ServletException {
		menuDAO = new MenuDAOImpl();
	}

	@SuppressWarnings("unused")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Integer restaurantId = null;

		// Check if restaurantId parameter is available
		String restaurantIdStr = request.getParameter("restaurantId");

		if (restaurantIdStr != null) {
			try {
				// Try parsing the restaurantId
				restaurantId = Integer.parseInt(restaurantIdStr);
				System.out.println("in menu " + restaurantId);
			} catch (NumberFormatException e) {
				System.err.println("Invalid restaurantID: " + restaurantIdStr);
				e.printStackTrace();
			}
		} else {
			System.err.println("restaurantID is missing in request parameters");
		}

		// If restaurantId is valid, retrieve menu list
		if (restaurantId != null) {
			try {
				List<Menu> menuList = menuDAO.getMenuByResId(restaurantId);
				System.out.println("Retrieved menuList: " + menuList); // Debug statement
				request.setAttribute("menuList", menuList);
			} catch (Exception e) {
				System.err.println("Error retrieving menu list: " + e.getMessage());
				e.printStackTrace();
			}
		}

		// Forward the request to the menu.jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
		dispatcher.forward(request, response);
	}
}
