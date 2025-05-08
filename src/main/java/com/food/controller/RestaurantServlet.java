package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestaurantDAOImpl restaurantDAO;

	@Override
	public void init() throws ServletException {
		restaurantDAO = new RestaurantDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// Get all restaurants from database
			List<Restaurant> restaurantList = restaurantDAO.getAllRestaurant();

			// Store in session to display in JSP
			HttpSession session = request.getSession();
			session.setAttribute("restaurantList", restaurantList);

			// Forward to restaurant.jsp
			request.getRequestDispatcher("restaurant.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error loading restaurants");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		try {
			if ("add".equals(action)) {
				addRestaurant(request, response);
			} else if ("update".equals(action)) {
				updateRestaurant(request, response);
			} else if ("delete".equals(action)) {
				deleteRestaurant(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error processing restaurant operation");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void addRestaurant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String cuisineType = request.getParameter("cuisineType");
		int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
		String location = request.getParameter("location");
		double rating = Double.parseDouble(request.getParameter("rating"));
		boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

		Restaurant restaurant = new Restaurant(0, name, cuisineType, deliveryTime, location, rating, isActive);

		restaurantDAO.addRestaurant(restaurant);
		response.sendRedirect("restaurant");
	}

	private void updateRestaurant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String cuisineType = request.getParameter("cuisineType");
		int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
		String location = request.getParameter("location");
		double rating = Double.parseDouble(request.getParameter("rating"));
		boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

		Restaurant restaurant = new Restaurant(id, name, cuisineType, deliveryTime, location, rating, isActive);

		restaurantDAO.updateRestaurant(restaurant);
		response.sendRedirect("restaurant");
	}

	private void deleteRestaurant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		restaurantDAO.deleteRestaurant(id);
		response.sendRedirect("restaurant");
	}
}