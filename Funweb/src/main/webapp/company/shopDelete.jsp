<%@page import="shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String product_id =  request.getParameter("product_id");

ShopDAO shopDAO = new ShopDAO();
shopDAO.deleteShop(id, product_id);

response.sendRedirect("shopping_get.jsp");
%>