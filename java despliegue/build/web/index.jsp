<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="controlador.Conectar" %>
<%@ page import="controlador.Registro" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java Web App</title>
</head>
<body>
    <h1>Registros:</h1>
    <table>
        <tr>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Dirección</th>
        </tr>
        <% 
        try {
            Conectar conexionBD = new Conectar();
            Connection conexion = conexionBD.establecerConexion();
            Statement statement = conexion.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM registro");
            while (resultSet.next()) {
                String nombre = resultSet.getString("nombre");
                String telefono = resultSet.getString("telefono");
                String direccion = resultSet.getString("direccion");
                Registro registro = new Registro(nombre, telefono, direccion);
        %>
        <tr>
            <td><%= registro.getNombre() %></td>
            <td><%= registro.getTelefono() %></td>
            <td><%= registro.getDireccion() %></td>
        </tr>
        <% 
            }
            resultSet.close();
            statement.close();
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
