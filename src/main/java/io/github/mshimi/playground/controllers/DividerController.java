package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.components.divider.DividerProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class DividerController {

    @GetMapping("/components/divider")
    public String divider(Model model) {
        model.addAttribute("plain", new DividerProps());

        model.addAttribute("styles", List.of(
                new DividerProps().style(DividerProps.Style.SOLID),
                new DividerProps().style(DividerProps.Style.DASHED),
                new DividerProps().style(DividerProps.Style.DOTTED)
        ));

        model.addAttribute("centerLabel", new DividerProps().label("OR"));
        model.addAttribute("leftLabel", new DividerProps()
                .label("Recent")
                .labelPosition(DividerProps.LabelPosition.LEFT));
        model.addAttribute("rightLabel", new DividerProps()
                .label("More")
                .labelPosition(DividerProps.LabelPosition.RIGHT));

        model.addAttribute("vertical", new DividerProps()
                .orientation(DividerProps.Orientation.VERTICAL));

        return "pages/divider";
    }
}
