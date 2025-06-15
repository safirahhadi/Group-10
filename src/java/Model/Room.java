/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Room {

    private int roomNumber;
    private String roomType;
    private double pricePerNight;
    private boolean availability;

    // Constructor kosong
    public Room() {
    }

    // Constructor penuh
    public Room(int roomNumber, String roomType, double pricePerNight, boolean availability) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.availability = availability;
    }

    public Room(String roomType, double pricePerNight, boolean availability) {
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.availability = availability;
    }

    // Getter & Setter
    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
}
