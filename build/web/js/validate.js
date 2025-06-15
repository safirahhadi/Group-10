/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validateForm() {
    const contact = document.querySelector('input[name="contact_number"]').value;
    const email = document.querySelector('input[name="email"]').value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!/^[0-9]{10,12}$/.test(contact)) {
        alert("Contact number must be 10-12 digits");
        return false;
    }
    if (!emailPattern.test(email)) {
        alert("Enter a valid email address");
        return false;
    }
    return true;
}

function validateForm() {
    var name = document.getElementById("customerName").value;
    if (name.length < 3) {
        alert("Customer name must be at least 3 characters.");
        return false;
    }
    return true;
}
