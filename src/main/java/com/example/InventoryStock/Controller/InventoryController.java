package com.example.InventoryStock.Controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.InventoryStock.Model.InventoryModel;
import com.example.InventoryStock.Repository.InventoryRepository;

@Controller
public class InventoryController {

    @Autowired
    private InventoryRepository repo;

    
    
    @GetMapping("/")
    public String showRolePage() {
        return "role";
    }

    // 🔹 Step 2: Handle Role Selection and Redirect to Login
    @PostMapping("/selectRole")
    public String selectRole(HttpServletRequest request) {
        String role = request.getParameter("role");
        request.getSession().setAttribute("selectedRole", role);
        return "redirect:/login";
    }
    
    @GetMapping("/login")
    public String loginPage(HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("selectedRole");
        request.setAttribute("role", role);
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(HttpServletRequest request) {
    	  HttpSession session = request.getSession();
    	String role =(String) request.getSession().getAttribute("selectedRole");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("admin".equals(role) && "admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loggedInRole", "admin");
            return "redirect:/home";
        }

        if ("user".equals(role) && "user".equals(username) && "user123".equals(password)) {
            session.setAttribute("loggedInRole", "user");
            return "redirect:/items";
        }

        // Login failed
        request.setAttribute("error", "Invalid credentials for " + role);
        request.setAttribute("role", role); // important to show again on login page
        return "login";
      
    }

    @GetMapping("/home")
    public String home(HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"admin".equals(role)) {
            return "redirect:/login";
        }
        return "Inventory";
    }

    @PostMapping("/submit")
    public String submitItem(HttpServletRequest request, @ModelAttribute InventoryModel item) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"admin".equals(role)) return "redirect:/login";
        repo.save(item);
        return "redirect:/items";
    }


    @GetMapping("/items")
    public String viewItems(HttpServletRequest request) {
        List<InventoryModel> items = repo.findAll();
        request.setAttribute("items", items);
        String role = (String) request.getSession().getAttribute("loggedInRole");
        request.setAttribute("role", role);
        Object msg = request.getSession().getAttribute("message");
        if (msg != null) {
            request.setAttribute("message", msg);
            request.getSession().removeAttribute("message");
        }
        return "view";
    }

    @GetMapping("/items/edit/{id}")
    public String editItem(@PathVariable int id, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"admin".equals(role)) return "redirect:/login";

        InventoryModel item = repo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid ID: " + id));
        request.setAttribute("item", item);
        return "edit";
    }

    @PostMapping("/items/update")
    public String updateItem(HttpServletRequest request, @ModelAttribute InventoryModel item) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"admin".equals(role)) return "redirect:/login";
        repo.save(item);
        return "redirect:/items";
    }

    @GetMapping("/items/delete/{id}")
    public String deleteItem(@PathVariable int id, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"admin".equals(role)) return "redirect:/login";
        repo.deleteById(id);
        return "redirect:/items";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }
    @PostMapping("/purchase/{id}")
    public String purchaseItem(@PathVariable int id, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("loggedInRole");
        if (!"user".equals(role)) return "redirect:/login";

        InventoryModel item = repo.findById(id).orElse(null);
        if (item != null && item.getQuantity() > 0) {
            item.setQuantity(item.getQuantity() - 1);
            repo.save(item);
            request.getSession().setAttribute("message", "Item purchased successfully!");
        }else {
            request.getSession().setAttribute("message", "❌ Item is out of stock.");
        }


        return "redirect:/items";
    }

}