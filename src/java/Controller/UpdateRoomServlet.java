/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.RoomDAO;
import Model.Room;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class UpdateRoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    @Override
    public void init() {
        roomDAO = new RoomDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        Room room = roomDAO.selectRoom(roomNumber);
        
        request.setAttribute("room", room);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateRoom.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String roomType = request.getParameter("roomType");
        double price = Double.parseDouble(request.getParameter("pricePerNight"));
        boolean availability = request.getParameter("availability") != null;

        Room room = new Room( roomNumber, roomType, price, availability);

        try {
            roomDAO.updateRoom(room);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listRooms");
    }
}