package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.htmx.JteuiHtmx;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    /**
     * Kept here for now. It's exercised by the toast page's "Server-side toast"
     * button. When we build ToastController in Phase 2, we'll move it there.
     */
    @PostMapping("/test/server-toast")
    @ResponseBody
    public String serverToast(HttpServletResponse response) {
        JteuiHtmx.success(response, "Toast fired from the server!");
        return "";
    }
}