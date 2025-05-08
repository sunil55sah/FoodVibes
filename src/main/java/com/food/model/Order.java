package com.food.model;

import java.util.Date;

public class Order {

	private int orderId;
	private int user_id;
	private int restaurant_id;
	private Date orderDate;
	private double totalAmount;
	private String status;
	private String paymentMethod;

	public Order() {

	}

	public Order(int orderId, int userId, int resturantId, Date orderDate, double totalAmount, String status,
			String paymentMethod) {
		super();
		this.orderId = orderId;
		this.user_id = userId;
		this.restaurant_id = resturantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return user_id;
	}

	public void setUserId(int userId) {
		this.user_id = userId;
	}

	public int getResturantId() {
		return restaurant_id;
	}

	public void setResturantId(int resturantId) {
		this.restaurant_id = resturantId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Override
	public String toString() {
		return orderId + " " + user_id + " " + restaurant_id + " " + orderDate + " " + totalAmount + " " + status + " "
				+ paymentMethod;
	}

}
