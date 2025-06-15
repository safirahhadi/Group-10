/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDAO;
import Model.Booking;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Che Zulaika
 */
public class BookingController extends HttpServlet {

    private BookingDAO bookingDAO;

    public void init() {
        bookingDAO = new BookingDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null) {

                switch (action) {
                    case "new":
                        showNewForm(request, response);
                        break;
                    case "insert":
                        insertBooking(request, response);
                        break;
                    case "delete":
                        deleteBooking(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "update":
                        updateBookingStatus(request, response);
                        break;
                    case "view":
                        listBooking(request, response);
                        break;

                    default:
                        break;
                }
            } else {
                listBooking(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        List<Booking> listBookings = bookingDAO.selectAllBookings();
        request.setAttribute("listBookings", listBookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listBooking.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("customerId", request.getParameter("customerId"));
        request.setAttribute("roomNumber", request.getParameter("roomNumber"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("addBooking.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        Booking newBooking = new Booking();
        newBooking.setCustomerId(customerId);
        newBooking.setRoomNumber(roomNumber);
        newBooking.setCheckIn(checkIn);
        newBooking.setCheckOut(checkOut);

        bookingDAO.insertBooking(newBooking);
        response.sendRedirect("listRooms");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Booking existingBooking = bookingDAO.selectBooking(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateBooking.jsp");
        request.setAttribute("booking", existingBooking);
        dispatcher.forward(request, response);
    }

    private void updateBookingStatus(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("bookingId"));
        String status = request.getParameter("status");
        System.out.println("ID: " + id);
        System.out.println("st: " + status);
        if (bookingDAO.updateStatusBooking(id, status)) {
            response.sendRedirect("booking");
        } else {
            response.sendError(401);
        }
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookingDAO.deleteBooking(id);
        response.sendRedirect("booking");
    }
}
