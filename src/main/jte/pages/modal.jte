@import io.github.mshimi.jteui.components.modal.ModalProps
@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.components.badge.BadgeProps
@import io.github.mshimi.jteui.components.input.InputProps
@import io.github.mshimi.jteui.components.input.InputType
@import io.github.mshimi.jteui.base.Variant
@import io.github.mshimi.jteui.base.Alpine

@param ModalProps basicModal
@param ModalProps modalSm
@param ModalProps modalMd
@param ModalProps modalLg
@param ModalProps modalXl
@param ModalProps modalNoBackdrop
@param ModalProps modalNoEsc
@param ModalProps modalNoCloseButton
@param ModalProps modalNoTransitions
@param ModalProps modalNoScrollLock
@param ModalProps modalScroll
@param ModalProps modalForm

@template.layout(
currentPath = "/components/modal",
pageTitle = "Modal — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Modal</h1>
        <p class="text-gray-600">
            Dialog overlays for focused interactions. Four sizes, configurable
            close behavior, scroll lock, transitions, and three content slots.
        </p>
    </header>

    <!-- Basic open/close -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Basic</h2>
        <p class="text-sm text-gray-500 mb-3">
            Default modal: closes via X button, backdrop click, or ESC key.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Open basic modal")
            .variant(Variant.PRIMARY)
            .onClick(Alpine.openModal("modal-basic"))
            )
        </div>

        @template.jteui.components.modal.modal(
        props = basicModal,
        header = @`<h3 class="text-lg font-semibold">Basic modal</h3>`,
        body = @`
            <p class="text-gray-700">
                This is a basic modal with all defaults. Click outside, press ESC,
                or click the X to close.
            </p>
        `,
        footer = @`
            <div class="flex justify-end gap-2">
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Close")
                .variant(Variant.OUTLINE)
                .onClick(Alpine.closeModal("modal-basic"))
                )
            </div>
        `
        )
    </section>

    <!-- Sizes -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Sizes</h2>
        <p class="text-sm text-gray-500 mb-3">Four sizes: SM, MD (default), LG, XL.</p>

        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex flex-wrap gap-3">
                @template.jteui.components.button.button(
                props = new ButtonProps().label("SM").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-sm"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("MD").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-md"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("LG").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-lg"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("XL").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-xl"))
                )
            </div>
        </div>

        @template.jteui.components.modal.modal(
        props = modalSm,
        header = @`<h3 class="text-lg font-semibold">Small modal</h3>`,
        body = @`<p class="text-gray-700">SM — max-w-sm. Good for confirmations.</p>`
        )
        @template.jteui.components.modal.modal(
        props = modalMd,
        header = @`<h3 class="text-lg font-semibold">Medium modal</h3>`,
        body = @`<p class="text-gray-700">MD — max-w-lg. The default. Fits most content.</p>`
        )
        @template.jteui.components.modal.modal(
        props = modalLg,
        header = @`<h3 class="text-lg font-semibold">Large modal</h3>`,
        body = @`<p class="text-gray-700">LG — max-w-2xl. For forms or longer content.</p>`
        )
        @template.jteui.components.modal.modal(
        props = modalXl,
        header = @`<h3 class="text-lg font-semibold">Extra large modal</h3>`,
        body = @`<p class="text-gray-700">XL — max-w-4xl. For complex layouts or data tables.</p>`
        )
    </section>

    <!-- Configuration -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Configuration</h2>
        <p class="text-sm text-gray-500 mb-3">
            Customize close behavior and transitions. Each example disables one
            close path — never all three at once (that would lock the user in).
        </p>

        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                @template.jteui.components.button.button(
                props = new ButtonProps().label("No backdrop close").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-no-backdrop"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("No ESC close").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-no-esc"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("No X button").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-no-close-button"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("No transitions").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-no-transitions"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps().label("No scroll lock").variant(Variant.OUTLINE)
                            .onClick(Alpine.openModal("modal-no-scroll-lock"))
                )
            </div>
        </div>

        <!-- No backdrop close -->
        @template.jteui.components.modal.modal(
        props = modalNoBackdrop,
        header = @`<h3 class="text-lg font-semibold">closeOnBackdrop = false</h3>`,
        body = @`
            <p class="text-gray-700">
                Clicking outside this modal does nothing. Close with ESC or the X button.
            </p>
        `
        )

        <!-- No ESC close -->
        @template.jteui.components.modal.modal(
        props = modalNoEsc,
        header = @`<h3 class="text-lg font-semibold">closeOnEsc = false</h3>`,
        body = @`
            <p class="text-gray-700">
                Pressing ESC does nothing. Close by clicking outside or pressing the X.
            </p>
        `
        )

        <!-- No close button -->
        @template.jteui.components.modal.modal(
        props = modalNoCloseButton,
        header = @`<h3 class="text-lg font-semibold">showCloseButton = false</h3>`,
        body = @`
            <p class="text-gray-700">
                No X button in the corner. Close via ESC, backdrop click, or a footer button.
            </p>
        `,
        footer = @`
            <div class="flex justify-end">
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Done")
                .variant(Variant.PRIMARY)
                .onClick(Alpine.closeModal("modal-no-close-button"))
                )
            </div>
        `
        )

        <!-- No transitions -->
        @template.jteui.components.modal.modal(
        props = modalNoTransitions,
        header = @`<h3 class="text-lg font-semibold">transitions = false</h3>`,
        body = @`
            <p class="text-gray-700">
                Snaps open and closed instantly. Useful for rapid interactions
                where animation feels sluggish, or for users who prefer reduced motion.
            </p>
        `
        )

        <!-- No scroll lock -->
        @template.jteui.components.modal.modal(
        props = modalNoScrollLock,
        header = @`<h3 class="text-lg font-semibold">lockScroll = false</h3>`,
        body = @`
            <p class="text-gray-700">
                Try scrolling the page in the background — it still works.
                Default behavior locks background scroll while a modal is open.
            </p>
        `
        )
    </section>

    <!-- Long content / scroll test -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Internal scroll</h2>
        <p class="text-sm text-gray-500 mb-3">
            When body content exceeds viewport height, the modal's body scrolls
            independently. Header and footer stay fixed.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Open scrolling modal")
            .variant(Variant.PRIMARY)
            .onClick(Alpine.openModal("modal-scroll"))
            )
        </div>

        @template.jteui.components.modal.modal(
        props = modalScroll,
        header = @`<h3 class="text-lg font-semibold">Terms of Service</h3>`,
        body = @`
            <div class="space-y-4 text-sm text-gray-700">
                <p>1. By using this service, you agree to the following terms.</p>
                <p>2. You will not abuse the service for malicious purposes.</p>
                <p>3. You will respect other users.</p>
                <p>4. You acknowledge that data may be retained for up to 30 days.</p>
                <p>5. You will not attempt to reverse-engineer the service.</p>
                <p>6. Your use of the service is at your own risk.</p>
                <p>7. We reserve the right to modify these terms at any time.</p>
                <p>8. Disputes are resolved under the laws of the European Union.</p>
                <p>9. The service is provided "as is" without warranty.</p>
                <p>10. We may suspend accounts for violations.</p>
                <p>11. You retain ownership of content you upload.</p>
                <p>12. We may use anonymized data for analytics.</p>
                <p>13. You may close your account at any time.</p>
                <p>14. We are not liable for indirect damages.</p>
                <p>15. These terms supersede prior agreements.</p>
                <p>16. Continued use after changes constitutes acceptance.</p>
                <p>17. You will receive notice of material changes by email.</p>
                <p>18. Translations are provided for convenience only.</p>
                <p>19. The English version is authoritative.</p>
                <p>20. Contact support for questions.</p>
            </div>
        `,
        footer = @`
            <div class="flex justify-end gap-2">
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Decline")
                .variant(Variant.OUTLINE)
                .onClick(Alpine.closeModal("modal-scroll"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Accept")
                .variant(Variant.PRIMARY)
                .onClick(Alpine.closeModal("modal-scroll"))
                )
            </div>
        `
        )
    </section>

    <!-- Form modal -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Form modal</h2>
        <p class="text-sm text-gray-500 mb-3">
            The most common real-world shape: header + form body + footer with actions.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Edit profile")
            .variant(Variant.PRIMARY)
            .icon("edit")
            .onClick(Alpine.openModal("modal-form"))
            )
        </div>

        @template.jteui.components.modal.modal(
        props = modalForm,
        header = @`
            <div class="flex items-center justify-between">
                <h3 class="text-lg font-semibold">Edit profile</h3>
                @template.jteui.components.badge.badge(
                props = new BadgeProps().label("Draft").variant(Variant.WARNING)
                )
            </div>
        `,
        body = @`
            <div class="space-y-4">
                @template.jteui.components.input.input(
                props = new InputProps()
                                .name("name")
                                .label("Display name")
                                .value("Alice Müller")
                .required(true)
                )
                @template.jteui.components.input.input(
                props = new InputProps()
                                .name("email")
                .type(InputType.EMAIL)
                .label("Email address")
                .value("alice@example.com")
                .helper("Used for notifications")
                .required(true)
                )
                @template.jteui.components.input.input(
                props = new InputProps()
                                .name("phone")
                .type(InputType.TEL)
                .label("Phone (optional)")
                .placeholder("+49 123 456 7890")
                )
            </div>
        `,
        footer = @`
            <div class="flex justify-end gap-2">
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Cancel")
                .variant(Variant.OUTLINE)
                .onClick(Alpine.closeModal("modal-form"))
                )
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Save changes")
                .variant(Variant.PRIMARY)
                .onClick(Alpine.closeModal("modal-form"))
                )
            </div>
        `
        )
    </section>

`
)