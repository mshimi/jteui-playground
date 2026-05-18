package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.components.form.ErrorPosition;
import io.github.mshimi.jteui.components.form.FormFieldProps;
import io.github.mshimi.jteui.components.form.FormProps;
import io.github.mshimi.jteui.components.form.FormRule;
import io.github.mshimi.jteui.components.form.ServerErrorDisplay;
import io.github.mshimi.jteui.components.form.ServerErrorMapper;
import io.github.mshimi.jteui.components.form.ValidationRules;
import io.github.mshimi.jteui.components.input.InputProps;
import io.github.mshimi.jteui.components.input.InputType;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class FormController {

    @GetMapping("/components/form")
    public String form(Model model) {

        // ─── Login form (simple per-field validation) ────────────────────
        model.addAttribute("loginForm", new FormProps()
                .hxPost("/demo/login")
                .hxTarget("#login-result")
                .hxSwap("innerHTML")
                .errorMapper(ServerErrorMapper.SPRING_DEFAULT)
                .displayMode(ServerErrorDisplay.PER_FIELD));

        model.addAttribute("loginEmail", new FormFieldProps()
                .name("email")
                .rules(ValidationRules.required(), ValidationRules.email()));

        model.addAttribute("loginEmailInput", new InputProps()
                .name("email")
                .label("Email address")
                .type(InputType.EMAIL)
                .placeholder("you@example.com"));

        model.addAttribute("loginPassword", new FormFieldProps()
                .name("password")
                .rules(ValidationRules.required(), ValidationRules.minLength(8)));

        model.addAttribute("loginPasswordInput", new InputProps()
                .name("password")
                .label("Password")
                .type(InputType.PASSWORD)
                .placeholder("Min 8 characters"));

        // ─── Registration form (cross-field rule) ────────────────────────
        model.addAttribute("regForm", new FormProps()
                .hxPost("/demo/register")
                .hxTarget("#reg-result")
                .hxSwap("innerHTML")
                .formRules(FormRule.fieldsMatch("regPassword", "regConfirm", "Passwords do not match"))
                .errorMapper(ServerErrorMapper.SPRING_DEFAULT)
                .displayMode(ServerErrorDisplay.BOTH));

        model.addAttribute("regUsernameField", new FormFieldProps()
                .name("regUsername")
                .rules(ValidationRules.required(), ValidationRules.minLength(3)));

        model.addAttribute("regUsernameInput", new InputProps()
                .name("regUsername")
                .label("Username")
                .placeholder("At least 3 characters"));

        model.addAttribute("regPasswordField", new FormFieldProps()
                .name("regPassword")
                .rules(ValidationRules.required(), ValidationRules.minLength(8)));

        model.addAttribute("regPasswordInput", new InputProps()
                .name("regPassword")
                .label("Password")
                .type(InputType.PASSWORD)
                .placeholder("Min 8 characters"));

        model.addAttribute("regConfirmField", new FormFieldProps()
                .name("regConfirm")
                .rules(ValidationRules.required()));

        model.addAttribute("regConfirmInput", new InputProps()
                .name("regConfirm")
                .label("Confirm password")
                .type(InputType.PASSWORD)
                .placeholder("Repeat your password"));

        // ─── Summary-only display mode ────────────────────────────────────
        model.addAttribute("summaryForm", new FormProps()
                .hxPost("/demo/contact")
                .hxTarget("#summary-result")
                .hxSwap("innerHTML")
                .errorMapper(ServerErrorMapper.SIMPLE_MESSAGE)
                .displayMode(ServerErrorDisplay.SUMMARY)
                .errorPosition(ErrorPosition.TOP));

        model.addAttribute("summaryNameField", new FormFieldProps()
                .name("contactName")
                .rules(ValidationRules.required()));

        model.addAttribute("summaryNameInput", new InputProps()
                .name("contactName")
                .label("Name")
                .placeholder("Your name"));

        model.addAttribute("summaryEmailField", new FormFieldProps()
                .name("contactEmail")
                .rules(ValidationRules.required(), ValidationRules.email()));

        model.addAttribute("summaryEmailInput", new InputProps()
                .name("contactEmail")
                .label("Email")
                .type(InputType.EMAIL)
                .placeholder("you@example.com"));

        return "pages/form";
    }

    // ─── Demo endpoints ───────────────────────────────────────────────────
    //
    // Success (2xx): return HTML — HTMX swaps it into hx-target.
    // Error (4xx):   return JSON — ServerErrorMapper parses it from xhr.responseText.

    @PostMapping("/demo/login")
    @ResponseBody
    public ResponseEntity<?> demoLogin(
            @RequestParam(defaultValue = "") String email,
            @RequestParam(defaultValue = "") String password) {
        if (email.contains("fail")) {
            return ResponseEntity.badRequest()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(Map.of(
                            "message", "Invalid credentials",
                            "errors", Map.of("email", "No account found for this email")));
        }
        return ResponseEntity.ok()
                .contentType(MediaType.TEXT_HTML)
                .body("<span>Signed in as " + escapeHtml(email) + "!</span>");
    }

    @PostMapping("/demo/register")
    @ResponseBody
    public ResponseEntity<?> demoRegister(
            @RequestParam(defaultValue = "") String regUsername) {
        if (regUsername.equalsIgnoreCase("admin")) {
            return ResponseEntity.badRequest()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(Map.of(
                            "message", "Username already taken",
                            "errors", Map.of("regUsername", "Choose a different username")));
        }
        return ResponseEntity.ok()
                .contentType(MediaType.TEXT_HTML)
                .body("<span>Account created for " + escapeHtml(regUsername) + "!</span>");
    }

    @PostMapping("/demo/contact")
    @ResponseBody
    public ResponseEntity<?> demoContact(
            @RequestParam(defaultValue = "") String contactEmail) {
        if (contactEmail.contains("fail")) {
            return ResponseEntity.badRequest()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(Map.of("error", "Service temporarily unavailable. Try again later."));
        }
        return ResponseEntity.ok()
                .contentType(MediaType.TEXT_HTML)
                .body("<span>Message sent!</span>");
    }

    private static String escapeHtml(String s) {
        return s == null ? "" : s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }
}
