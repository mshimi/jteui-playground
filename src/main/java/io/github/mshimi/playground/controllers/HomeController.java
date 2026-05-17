package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Action;
import io.github.mshimi.jteui.base.Size;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.alert.AlertProps;
import io.github.mshimi.jteui.components.badge.BadgeProps;
import io.github.mshimi.jteui.components.button.ButtonProps;
import io.github.mshimi.jteui.components.card.CardProps;
import io.github.mshimi.jteui.components.confirmModal.ConfirmModalProps;
import io.github.mshimi.jteui.components.modal.ModalProps;
import io.github.mshimi.jteui.htmx.JteuiHtmx;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        var buttons = List.of(
                new ButtonProps().label("Primary").variant(Variant.PRIMARY),
                new ButtonProps().label("Secondary").variant(Variant.SECONDARY),
                new ButtonProps().label("Outline").variant(Variant.OUTLINE),
                new ButtonProps().label("Ghost").variant(Variant.GHOST),
                new ButtonProps().label("Success").variant(Variant.SUCCESS),
                new ButtonProps().label("Warning").variant(Variant.WARNING),
                new ButtonProps().label("Danger").variant(Variant.DANGER),

                new ButtonProps().label("XS").size(Size.XS),
                new ButtonProps().label("Small").size(Size.SM),
                new ButtonProps().label("Medium").size(Size.MD),
                new ButtonProps().label("Large").size(Size.LG),
                new ButtonProps().label("Extra Large").size(Size.XL),

                new ButtonProps().label("With Icon").icon("check"),
                new ButtonProps().label("Loading").loading(true).variant(Variant.PRIMARY),
                new ButtonProps().label("Disabled").disabled(true),

                new ButtonProps().label("Go to Google").href("https://google.com").variant(Variant.LINK)
        );

        var badges = List.of(
                new BadgeProps().label("Active").variant(Variant.SUCCESS).dot(true),
                new BadgeProps().label("Pending").variant(Variant.WARNING).dot(true),
                new BadgeProps().label("Failed").variant(Variant.DANGER).dot(true),
                new BadgeProps().label("v0.1").variant(Variant.SECONDARY),
                new BadgeProps().label("New").variant(Variant.PRIMARY)
        );

        var alerts = List.of(
                new AlertProps().variant(Variant.SUCCESS).title("Profile saved").message("Your changes have been saved successfully."),
                new AlertProps().variant(Variant.WARNING).message("Your session will expire in 5 minutes."),
                new AlertProps().variant(Variant.DANGER).title("Connection lost").message("We couldn't reach the server. Retrying...").dismissible(true),
                new AlertProps().variant(Variant.INFO).message("New version available. Refresh to update.")
        );

        var confirmDelete = new ConfirmModalProps()
                .id("confirm-delete")
                .title("Delete user?")
                .message("This action cannot be undone. The user and all their data will be permanently removed.")
                .confirmLabel("Delete")
                .confirmVariant(Variant.DANGER)
                .confirmAction(Action.create()
                        .hxDelete("/users/999")
                        .hxTarget("body")
                        .hxSwap("none"));
        model.addAttribute("confirmDelete", confirmDelete);

        var modalProps = new ModalProps().id("profile").size(ModalProps.Size.MD);
        model.addAttribute("modalProps", modalProps);

        model.addAttribute("alerts", alerts);

        model.addAttribute("badges", badges);

        model.addAttribute("cardProps", new CardProps().style(CardProps.Style.ELEVATED));

        model.addAttribute("buttons", buttons);
        return "home";
    }


    @PostMapping("/test/server-toast")
    @ResponseBody
    public String serverToast(HttpServletResponse response) {
        JteuiHtmx.success(response, "Toast fired from the server!");
        return "";  // Empty body — the toast comes via HX-Trigger header
    }
}