package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.base.Action;
import io.github.mshimi.jteui.base.Variant;
import io.github.mshimi.jteui.components.confirmModal.ConfirmModalProps;
import io.github.mshimi.jteui.htmx.HtmxSwap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class ConfirmModalController {

    @GetMapping("/components/confirm-modal")
    public String confirmModal(Model model) {
        // Destructive: delete user
        model.addAttribute("deleteUser", new ConfirmModalProps()
                .id("confirm-delete-user")
                .title("Delete user?")
                .message("This action cannot be undone. The user and all their data will be permanently removed.")
                .confirmLabel("Delete")
                .confirmVariant(Variant.DANGER)
                .confirmAction(Action.create()
                        .hxDelete("/test/delete-user/42")
                        .hxSwap(HtmxSwap.NONE)));

        // Confirming a save
        model.addAttribute("saveChanges", new ConfirmModalProps()
                .id("confirm-save-changes")
                .title("Save changes?")
                .message("You're about to publish these changes to all users. Confirm to proceed.")
                .confirmLabel("Publish")
                .confirmVariant(Variant.SUCCESS)
                .confirmAction(Action.create()
                        .hxPost("/test/save-changes")
                        .hxSwap(HtmxSwap.NONE)));

        // Discard / leave page
        model.addAttribute("discardChanges", new ConfirmModalProps()
                .id("confirm-discard")
                .title("Discard unsaved changes?")
                .message("Your edits will be lost. Are you sure you want to leave?")
                .confirmLabel("Discard")
                .confirmVariant(Variant.WARNING)
                .cancelLabel("Keep editing")
                .confirmAction(Action.create()
                        .hxPost("/test/discard-changes")
                        .hxSwap(HtmxSwap.NONE)));

        // Neutral confirmation (just a "yes / no")
        model.addAttribute("neutralConfirm", new ConfirmModalProps()
                .id("confirm-neutral")
                .title("Send notification email?")
                .message("All team members will receive an email about this update.")
                .confirmLabel("Send email")
                .confirmVariant(Variant.PRIMARY)
                .confirmAction(Action.create()
                        .hxPost("/test/send-notification")
                        .hxSwap(HtmxSwap.NONE)));

        return "pages/confirmModal";
    }

    // Stub endpoints so the HTMX requests don't 404. Each fires a toast
    // confirming the action so users see the flow end-to-end.

    @PostMapping("/test/delete-user/42")
    @ResponseBody
    public String deleteUser(jakarta.servlet.http.HttpServletResponse response) {
        io.github.mshimi.jteui.htmx.JteuiHtmx.success(response, "User deleted");
        return "";
    }

    @PostMapping("/test/save-changes")
    @ResponseBody
    public String saveChanges(jakarta.servlet.http.HttpServletResponse response) {
        io.github.mshimi.jteui.htmx.JteuiHtmx.success(response, "Changes published");
        return "";
    }

    @PostMapping("/test/discard-changes")
    @ResponseBody
    public String discardChanges(jakarta.servlet.http.HttpServletResponse response) {
        io.github.mshimi.jteui.htmx.JteuiHtmx.info(response, "Changes discarded");
        return "";
    }

    @PostMapping("/test/send-notification")
    @ResponseBody
    public String sendNotification(jakarta.servlet.http.HttpServletResponse response) {
        io.github.mshimi.jteui.htmx.JteuiHtmx.success(response, "Notification sent");
        return "";
    }
}