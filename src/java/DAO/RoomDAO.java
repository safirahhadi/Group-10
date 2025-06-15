/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.Room;

public class RoomDAO {

    private static final String INSERT_ROOM_SQL = "INSERT INTO rooms (room_number, room_type, price_per_night, availability) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ROOM_BY_ID = "SELECT * FROM rooms WHERE room_number = ?";
    private static final String SELECT_ALL_ROOMS = "SELECT * FROM rooms";
    private static final String DELETE_ROOM_SQL = "DELETE FROM rooms WHERE room_number = ?";
    private static final String UPDATE_ROOM_SQL = "UPDATE rooms SET room_type = ?, price_per_night = ?, availability = ? WHERE room_number = ?";


    // CREATE
    public void insertRoom(Room room) throws SQLException {
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_ROOM_SQL)) {
            ps.setInt(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setDouble(3, room.getPricePerNight());
            ps.setBoolean(4, room.isAvailability());
            ps.executeUpdate();
        }
    }

    // READ (by id)
    public Room selectRoom(int room_number) {
        Room room = null;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ROOM_BY_ID)) {
            ps.setInt(1, room_number);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int roomNumber = rs.getInt("room_number");
                String roomType = rs.getString("room_type");
                double price = rs.getDouble("price_per_night");
                boolean available = rs.getBoolean("availability");
                room = new Room(roomNumber, roomType, price, available);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

    // READ (all)
    public List<Room> selectAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_ROOMS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(
                    rs.getInt("room_number"),
                    rs.getString("room_type"),
                    rs.getDouble("price_per_night"),
                    rs.getBoolean("availability")
                );
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // UPDATE
    public boolean updateRoom(Room room) throws SQLException {
        boolean updated;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_ROOM_SQL)) {
            ps.setString(1, room.getRoomType());
            ps.setDouble(2, room.getPricePerNight());
            ps.setBoolean(3, room.isAvailability());
            ps.setInt(4, room.getRoomNumber());
            updated = ps.executeUpdate() > 0;
        }
        return updated;
    }

    // DELETE
    public boolean deleteRoom(int id) throws SQLException {
        boolean deleted;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_ROOM_SQL)) {
            ps.setInt(1, id);
            deleted = ps.executeUpdate() > 0;
        }
        return deleted;
    }
}
