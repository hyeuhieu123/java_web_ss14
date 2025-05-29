package com.data.controller;

import com.data.model.CartItem;
import com.data.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("cart")
public class CartController {
    @GetMapping
    public String showCart(Model model, HttpServletRequest request, HttpSession session) {
        List<Product> products = getProductsFromCookie(request);
        Map<Integer, Integer> cart = getCart(session);

        List<CartItem> cartItems = new ArrayList<>();
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            int productId = entry.getKey();
            int quantity = entry.getValue();
            products.stream()
                    .filter(p -> p.getId() == productId)
                    .findFirst()
                    .ifPresent(p -> cartItems.add(new CartItem(p, quantity)));
        }

        model.addAttribute("products", products);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("newItem", new CartItem());
        return "cart";
    }

    @PostMapping("/addToCart")
    public String addToCart(@RequestParam int productId,
                            @RequestParam int quantity,
                            HttpSession session) {
        if (quantity <= 0) {
            quantity = 1; // mặc định nếu nhập sai
        }
        Map<Integer, Integer> cart = getCart(session);
        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    @GetMapping("/deleteCart/{productId}")
    public String deleteFromCart(@PathVariable int productId, HttpSession session) {
        Map<Integer, Integer> cart = getCart(session);
        cart.remove(productId);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    private List<Product> getProductsFromCookie(HttpServletRequest request) {
        List<Product> list = new ArrayList<>();
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies == null) return list;

        for (javax.servlet.http.Cookie cookie : cookies) {
            if ("products".equals(cookie.getName())) {
                try {
                    String value = java.net.URLDecoder.decode(cookie.getValue(), "UTF-8");
                    String[] items = value.split("\\|");
                    for (String item : items) {
                        String[] parts = item.split("-");
                        if (parts.length == 3) {
                            int id = Integer.parseInt(parts[0]);
                            String name = parts[1];
                            double price = Double.parseDouble(parts[2]);
                            list.add(new Product(id, name, price));
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    private Map<Integer, Integer> getCart(HttpSession session) {
        Object obj = session.getAttribute("cart");
        if (obj == null) {
            Map<Integer, Integer> cart = new HashMap<>();
            session.setAttribute("cart", cart);
            return cart;
        } else {
            return (Map<Integer, Integer>) obj;
        }
    }
}
