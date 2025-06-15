/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import Model.Booking;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Che Zulaika
 */
public class BookingDAO {
    
    private String jdbcURL = "jdbc:mysql://localhost:3306/hotel_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_BOOKING = "INSERT INTO booking (customer_id, room_number, check_in, check_out) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_BOOKING = "SELECT * FROM booking";
    private static final String SELECT_BOOKING_BY_ID = "SELECT * FROM booking WHERE booking_id=?";
    private static final String UPDATE_BOOKING_STATUS = "UPDATE booking SET status=? WHERE booking_id=?";
    private static final String DELETE_BOOKING = "DELETE FROM booking WHERE booking_id=?";
    private static final String SELECT_BOOKING_BY_CUSTOMER = "SELECT * FROM booking WHERE customer_id = ?";


    public void insertBooking(Booking booking) throws SQLException {
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_BOOKING)) {
            statement.setInt(1, booking.getCustomerId());
            statement.setInt(2, booking.getRoomNumber());
            statement.setString(3, booking.getCheckIn());
            statement.setString(4, booking.getCheckOut());
            statement.executeUpdate();
        }
    }

    public List<Booking> selectAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ALL_BOOKING); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(Integer.parseInt(rs.getString("customer_id")));
                booking.setRoomNumber(rs.getInt("room_number"));
                booking.setCheckIn(rs.getString("check_in"));
                booking.setCheckOut(rs.getString("check_out"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return bookings;
    }

    public Booking selectBooking(int id) {
        Booking booking = null;
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_BOOKING_BY_ID)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(Integer.parseInt(rs.getString("customer_id")));
                booking.setRoomNumber(rs.getInt("room_number"));
                booking.setCheckIn(rs.getString("check_in"));
                booking.setCheckOut(rs.getString("check_out"));
                booking.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return booking;
    }
    
    public static List<Booking> selectBookingCustomer(int customerId) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_BOOKING_BY_CUSTOMER)) {
            statement.setInt(1, customerId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(Integer.parseInt(rs.getString("customer_id")));
                booking.setRoomNumber(rs.getInt("room_number"));
                booking.setCheckIn(rs.getString("check_in"));
                booking.setCheckOut(rs.getString("check_out"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return bookings;
    }

//    public boolean updateBooking(Booking booking) throws SQLException {
//        boolean rowUpdated;
//        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_BOOKING)) {
//            statement.setString(1, booking.getCustomerName());
//            statement.setInt(2, booking.getRoomNumber());
//            statement.setString(3, booking.getCheckIn());
//            statement.setString(4, booking.getCheckOut());
//            statement.setString(5, booking.getStatus());
//            statement.setInt(6, booking.getBookingId());
//            rowUpdated = statement.executeUpdate() > 0;
//        }
//        return rowUpdated;
//    }
    
    public boolean updateStatusBooking(int id, String status){
        boolean rowUpdated = false;
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_BOOKING_STATUS)) {
            statement.setString(1, status);
            statement.setInt(2, id);
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowUpdated;
    }

    public boolean deleteBooking(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_BOOKING)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
    

