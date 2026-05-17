package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.components.modal.ModalProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class ModalController {

    @GetMapping("/components/modal")
    public String modal(Model model) {
        // Basic modal — defaults everywhere
        model.addAttribute("basicModal", new ModalProps().id("modal-basic"));

        // Sizes
        model.addAttribute("modalSm", new ModalProps().id("modal-sm").size(ModalProps.Size.SM));
        model.addAttribute("modalMd", new ModalProps().id("modal-md").size(ModalProps.Size.MD));
        model.addAttribute("modalLg", new ModalProps().id("modal-lg").size(ModalProps.Size.LG));
        model.addAttribute("modalXl", new ModalProps().id("modal-xl").size(ModalProps.Size.XL));

        // Configuration toggles — each demonstrates ONE disabled close path,
        // never all three (so user always has a way out)
        model.addAttribute("modalNoBackdrop", new ModalProps()
                .id("modal-no-backdrop")
                .closeOnBackdrop(false));

        model.addAttribute("modalNoEsc", new ModalProps()
                .id("modal-no-esc")
                .closeOnEsc(false));

        model.addAttribute("modalNoCloseButton", new ModalProps()
                .id("modal-no-close-button")
                .showCloseButton(false));

        model.addAttribute("modalNoTransitions", new ModalProps()
                .id("modal-no-transitions")
                .transitions(false));

        model.addAttribute("modalNoScrollLock", new ModalProps()
                .id("modal-no-scroll-lock")
                .lockScroll(false));

        // Long content — to test internal scrolling
        model.addAttribute("modalScroll", new ModalProps()
                .id("modal-scroll")
                .size(ModalProps.Size.MD));

        // Form pattern — header + body with inputs + footer with actions
        model.addAttribute("modalForm", new ModalProps()
                .id("modal-form")
                .size(ModalProps.Size.MD));

        return "pages/modal";
    }
}