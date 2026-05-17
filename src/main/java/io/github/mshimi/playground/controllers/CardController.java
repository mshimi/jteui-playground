package io.github.mshimi.playground.controllers;

import io.github.mshimi.jteui.components.card.CardProps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class CardController {

    @GetMapping("/components/card")
    public String card(Model model) {
        // Card uses content slots, so the page template provides
        // the actual content inline. Controllers just supply prop
        // configurations.
        model.addAttribute("elevatedCard", new CardProps()
                .style(CardProps.Style.ELEVATED)
                .padding(CardProps.Padding.MD));

        model.addAttribute("outlinedCard", new CardProps()
                .style(CardProps.Style.OUTLINED)
                .padding(CardProps.Padding.MD));

        model.addAttribute("filledCard", new CardProps()
                .style(CardProps.Style.FILLED)
                .padding(CardProps.Padding.MD));

        model.addAttribute("paddingNoneCard", new CardProps()
                .style(CardProps.Style.OUTLINED)
                .padding(CardProps.Padding.NONE));

        model.addAttribute("paddingSmCard", new CardProps()
                .style(CardProps.Style.OUTLINED)
                .padding(CardProps.Padding.SM));

        model.addAttribute("paddingLgCard", new CardProps()
                .style(CardProps.Style.OUTLINED)
                .padding(CardProps.Padding.LG));

        model.addAttribute("bodyOnlyCard", new CardProps()
                .style(CardProps.Style.OUTLINED)
                .padding(CardProps.Padding.MD));

        model.addAttribute("fullCard", new CardProps()
                .style(CardProps.Style.ELEVATED)
                .padding(CardProps.Padding.MD));



        // Image cards — different approaches
        model.addAttribute("imageInBody", new CardProps()
                .style(CardProps.Style.ELEVATED).padding(CardProps.Padding.MD));

        model.addAttribute("imageInHeader", new CardProps()
                .style(CardProps.Style.ELEVATED).padding(CardProps.Padding.MD));

        model.addAttribute("imageEdgeToEdge", new CardProps()
                .style(CardProps.Style.ELEVATED).padding(CardProps.Padding.NONE));

        model.addAttribute("imageAvatar", new CardProps()
                .style(CardProps.Style.OUTLINED).padding(CardProps.Padding.MD));


        return "pages/card";
    }
}