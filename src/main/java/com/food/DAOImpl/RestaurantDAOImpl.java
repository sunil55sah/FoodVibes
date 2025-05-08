package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {

	// Database configuration
	private static final String URL = "jdbc:mysql://localhost:3306/food_delivery_app";
	private static final String USER = "root";
	private static final String PASS = "root";

	// SQL queries
	private static final String INSERT_QUERY = "INSERT INTO `restaurant` (`restaurant_name`,`cousine_type`,`delivery_time`,`address`,`rating`,`is_active`,`img_path`) VALUES (?,?,?,?,?,?,?)";
	private static final String RETRIEVE_QUERY = "SELECT * FROM `restaurant` WHERE `restaurant_id` = ?";
	private static final String UPDATE_QUERY = "UPDATE `restaurant` SET `restaurant_name`=?, `cousine_type`=?, `delivery_time`=?, `address`=?, `rating`=?, `is_active`=?, `img_path`=? WHERE `restaurant_id`=?";
	private static final String DELETE_QUERY = "DELETE FROM `restaurant` WHERE `restaurant_id`=?";
	private static final String SELECT_ALL_QUERY = "SELECT * FROM `restaurant`";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to load MySQL JDBC driver");
		}
	}

	@Override
	public void addRestaurant(Restaurant restaurant) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {

			statement.setString(1, restaurant.getRestaurantName());
			statement.setString(2, restaurant.getCusineType());
			statement.setInt(3, restaurant.getDeliveryTime());
			statement.setString(4, restaurant.getAddress());
			statement.setDouble(5, restaurant.getRating());
			statement.setBoolean(6, restaurant.getIsActive());
			statement.setString(7, restaurant.getImgPath());

			int rowsAffected = statement.executeUpdate();
			System.out.println("Rows affected: " + rowsAffected);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = connection.prepareStatement(RETRIEVE_QUERY)) {

			statement.setInt(1, restaurantId);

			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return extractRestaurantFromResultSet(resultSet);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Restaurant extractRestaurantFromResultSet(ResultSet res) throws SQLException {
		Restaurant restaurant = new Restaurant();
		restaurant.setrestaurantId(res.getInt("restaurant_id"));
		restaurant.setRestaurantName(res.getString("restaurant_name"));
		restaurant.setCusineType(res.getString("cousine_type"));
		restaurant.setDeliveryTime(res.getInt("delivery_time"));
		restaurant.setAddress(res.getString("address"));
		restaurant.setRating(res.getDouble("rating"));
		restaurant.setActive(res.getBoolean("is_active"));
		restaurant.setImgPath(res.getString("img_path"));
		return restaurant;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {

			statement.setString(1, restaurant.getRestaurantName());
			statement.setString(2, restaurant.getCusineType());
			statement.setInt(3, restaurant.getDeliveryTime());
			statement.setString(4, restaurant.getAddress());
			statement.setDouble(5, restaurant.getRating());
			statement.setBoolean(6, restaurant.getIsActive());
			statement.setString(7, restaurant.getImgPath());
			statement.setInt(8, restaurant.getrestaurantId());

			int rowsAffected = statement.executeUpdate();
			System.out.println("Rows affected: " + rowsAffected);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {

			statement.setInt(1, restaurantId);
			int rowsAffected = statement.executeUpdate();
			System.out.println("Rows affected: " + rowsAffected);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		List<Restaurant> restaurants = new ArrayList<>();

		try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery(SELECT_ALL_QUERY)) {

			while (resultSet.next()) {
				restaurants.add(extractRestaurantFromResultSet(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurants;
	}
}