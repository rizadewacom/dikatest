<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.json.JSONObject" %>
<%
    // Set header untuk mengembalikan JSON
    response.setContentType("application/json");

    // Membaca data POST dari JavaScript
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

    // Parsing data JSON dari request
    String requestBody = sb.toString();
    JSONObject jsonResponse = new JSONObject();

    try {
        JSONObject jsonRequest = new JSONObject(requestBody);
        String username = jsonRequest.getString("username");
        String password = jsonRequest.getString("password");

        // Simulasi logika login (ganti dengan logika Anda sendiri)
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

    // Mengirimkan respons JSON kembali ke JavaScript
    out.print(jsonResponse.toString());
%>