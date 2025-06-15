/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.RoomDAO;
import Model.Room;
import Model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ListRoomsServlet extends HttpServlet {

    private RoomDAO roomDAO;
    
    @Override
    public void init() {
        roomDAO = new RoomDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
//        request.getRequestDispatcher("listRooms.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = session.getAttribute("user") != null ? (User) session.getAttribute("user") : null;
        if (user != null) {
            request.setAttribute("user", user);
            List<Room> roomList = roomDAO.selectAllRooms();
            request.setAttribute("roomLists", roomList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("listRooms.jsp");
            dispatcher.forward(request, response);
            
        }else{
            response.sendRedirect(request.getContextPath()+"/login?error=Please login first");
            return;
        }
        
    }
    
    
}
