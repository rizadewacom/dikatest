<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.json.JSONObject" %>
<%
    response.setContentType("application/json");

    StringBuilder sb = new StringBuilder();
    String line;
    try {
        BufferedReader reader = request.getReader();
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    String requestBody = sb.toString();
    JSONObject jsonResponse = new JSONObject();

    try {
        JSONObject jsonRequest = new JSONObject(requestBody);
        String username = jsonRequest.getString("username");
        String password = jsonRequest.getString("password");

        if (username.equals("admin") && password.equals("12345")) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "Login berhasil!");
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Username atau password salah!");
        }
    } catch (Exception e) {
        jsonResponse.put("success", false);
        jsonResponse.put("message", "Terjadi kesalahan: " + e.getMessage());
    }

    out.print(jsonResponse.toString());
%>