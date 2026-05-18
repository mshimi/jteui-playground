package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Alpine;
import io.github.mshimi.jteui.components.button.ButtonProps;
import io.github.mshimi.jteui.components.form.FormFieldProps;
import io.github.mshimi.jteui.components.form.FormProps;
import io.github.mshimi.jteui.components.form.ServerErrorDisplay;
import io.github.mshimi.jteui.components.form.ServerErrorMapper;
import io.github.mshimi.jteui.components.form.ValidationRules;
import io.github.mshimi.jteui.components.input.InputProps;
import io.github.mshimi.jteui.components.input.InputType;
import io.github.mshimi.jteui.components.modal.ModalProps;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class FormInModalController {

    private static final String MODAL_ID = "edit-profile-modal";

    @GetMapping("/components/form-in-modal")
    public String formInModal(Model model) {
        buildPageModel(model, "Alice Müller", "alice@example.com");
        return "pages/formInModal";
    }

    @PostMapping("/demo/profile-update")
    public Object profileUpdate(
            @RequestParam(defaultValue = "") String profileName,
            @RequestParam(defaultValue = "") String profileEmail,
            Model model) {

        if (profileEmail.endsWith("blocked.com")) {
            return ResponseEntity.badRequest()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(Map.of(
                            "message", "Email domain not allowed",
                            "errors", Map.of("profileEmail", "This email domain is not permitted")));
        }

        String name = profileName.isBlank() ? "Unknown" : profileName;
        model.addAttribute("name", name);
        model.addAttribute("email", profileEmail);
        return new ModelAndView("pages/fragments/profileCard", model.asMap());
    }

    // ─── Shared model builder ─────────────────────────────────────────────

    private void buildPageModel(Model model, String defaultName, String defaultEmail) {
        model.addAttribute("currentName", defaultName);
        model.addAttribute("currentEmail", defaultEmail);

        model.addAttribute("editModal", new ModalProps()
                .id(MODAL_ID)
                .size(ModalProps.Size.MD));

        model.addAttribute("profileForm", new FormProps()
                .id("profile-form")
                .hxPost("/demo/profile-update")
                .hxTarget("#profile-card")
                .hxSwap("outerHTML")
                .onSuccess(
                        Alpine.closeModal(MODAL_ID),
                        Alpine.toastSuccess("Profile updated!"))
                .errorMapper(ServerErrorMapper.SPRING_DEFAULT)
                .displayMode(ServerErrorDisplay.PER_FIELD));

        model.addAttribute("nameField", new FormFieldProps()
                .name("profileName")
                .rules(ValidationRules.required(), ValidationRules.minLength(2)));

        model.addAttribute("nameInput", new InputProps()
                .name("profileName")
                .label("Full name")
                .value(defaultName)
                .placeholder("Your name"));

        model.addAttribute("emailField", new FormFieldProps()
                .name("profileEmail")
                .rules(ValidationRules.required(), ValidationRules.email()));

        model.addAttribute("emailInput", new InputProps()
                .name("profileEmail")
                .label("Email address")
                .type(InputType.EMAIL)
                .value(defaultEmail)
                .placeholder("you@example.com"));
    }
}
