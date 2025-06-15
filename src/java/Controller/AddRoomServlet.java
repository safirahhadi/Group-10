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

public class AddRoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    /**
     *
     */
    @Override
    public void init() {
        roomDAO = new RoomDAO(); // sambungkan DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Dapatkan data dari borang
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String roomType = request.getParameter("roomType");
        double price = Double.parseDouble(request.getParameter("pricePerNight"));
        boolean availability = request.getParameter("availability") != null;

        // Simpan dalam objek Room
        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setPricePerNight(price);
        room.setAvailability(availability);

        // Simpan ke DB
        try {
            roomDAO.insertRoom(room);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect ke senarai bilik
        response.sendRedirect("listRooms");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addRoom.jsp");
        dispatcher.forward(request, response);
    }
}