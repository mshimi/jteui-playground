@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.components.badge.BadgeProps
@import io.github.mshimi.jteui.components.card.CardProps
@import io.github.mshimi.jteui.components.alert.AlertProps
@import io.github.mshimi.jteui.components.modal.ModalProps
@import io.github.mshimi.jteui.base.Variant
@import io.github.mshimi.jteui.base.Alpine
@import io.github.mshimi.jteui.base.Action
@import io.github.mshimi.jteui.htmx.HtmxSwap
@import io.github.mshimi.jteui.components.toast.ToastContainerProps
@import io.github.mshimi.jteui.base.ToastPosition
@import io.github.mshimi.jteui.components.input.InputProps
@import io.github.mshimi.jteui.components.input.InputType
@import io.github.mshimi.jteui.components.icon.IconProps
@import io.github.mshimi.jteui.base.Size
@import java.util.List
@import io.github.mshimi.jteui.components.input.InputState

@import io.github.mshimi.jteui.components.confirmModal.ConfirmModalProps
@param ConfirmModalProps confirmDelete

@param ModalProps modalProps

@param List<ButtonProps> buttons
@param List<BadgeProps> badges
@param CardProps cardProps
@param List<AlertProps> alerts

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>jteui playground</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/htmx.org@2"></script>

</head>
<body class="bg-gray-50 p-8">

@template.jteui.provider(
withModal = true,
loadAlpine = true,
withToast = true,
content = @`

    <div class="max-w-3xl mx-auto">
        <h1 class="text-3xl font-bold mb-6">jteui — Button gallery</h1>
        <p class="text-gray-600 mb-8">All buttons below come from the jteui library.</p>

        <div class="flex flex-wrap gap-3 p-6 bg-white rounded-lg shadow">
            @for(var btn : buttons)
                @template.jteui.components.button.button(props = btn)
            @endfor
        </div>
    </div>

    <div>
        <h2 class="text-xl font-bold mt-8 mb-4">Badges</h2>
        <div class="flex flex-wrap gap-3 p-6 bg-white rounded-lg shadow">
            @for(var b : badges)
                @template.jteui.components.badge.badge(props = b)
            @endfor
        </div>
    </div>

    @template.cardComponenet(cardProps = cardProps)

    <div>
        <h2 class="text-xl font-bold mt-8 mb-4">Alerts</h2>
        <div class="space-y-3 p-6 bg-white rounded-lg shadow">
            @for(var a : alerts)
                @template.jteui.components.alert.alert(props = a)
            @endfor
        </div>
    </div>

    <div>
        <h2 class="text-xl font-bold mt-8 mb-4">Modal</h2>
        <div class="p-6 bg-white rounded-lg shadow">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Open profile modal")
            .variant(Variant.PRIMARY)
            .attr("@click", "$store.modals.show('profile')")
            )
        </div>

        @template.jteui.components.modal.modal(
        props = modalProps,
        header = @`
            <h3 class="text-lg font-semibold">Edit profile</h3>
            <p class="text-sm text-gray-500">Update your account information</p>
        `,
        body = @`
            <p class="text-gray-700">This is the modal body. It can contain any content.</p>
            <p class="text-gray-700 mt-4">Click outside, press ESC, or click the X to close.</p>
        `,
        footer = @`
            <div class="flex justify-end gap-2">
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Cancel")
                .variant(Variant.OUTLINE)
                .attr("@click", "$store.modals.hide('profile')")
                )
                @template.jteui.components.button.button(
                props = new ButtonProps()
                                .label("Save changes")
                .variant(Variant.PRIMARY)
                .attr("@click", "$store.modals.hide('profile')")
                )
            </div>
        `
        )
    </div>

    <div>
        <!-- ... existing content ... -->

        <h2 class="text-xl font-bold mt-8 mb-4">ConfirmModal</h2>
        <div class="p-6 bg-white rounded-lg shadow">
            @template.jteui.components.button.button(
            props = new ButtonProps()
            .label("Delete user")
            .variant(Variant.DANGER)
            .attr("@click", "$store.modals.show('confirm-delete')")
            )
        </div>

        @template.jteui.components.confirmModal.confirmModal(props = confirmDelete)
    </div>

    @template.jteui.components.toast.toastContainer(
    props = new io.github.mshimi.jteui.components.toast.ToastContainerProps()
    .position(io.github.mshimi.jteui.base.ToastPosition.TOP_RIGHT)
    )

    <div>
        <h2 class="text-xl font-bold mt-8 mb-4">Toast</h2>
        <div class="flex flex-wrap gap-3 p-6 bg-white rounded-lg shadow">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                .label("Success toast")
            .variant(Variant.SUCCESS)
            .onClick(Alpine.toastSuccess("Profile saved!"))
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
                .label("Error toast")
            .variant(Variant.DANGER)
            .onClick(Alpine.toastError("Something went wrong"))
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
                .label("Warning toast")
            .variant(Variant.WARNING)
            .onClick(Alpine.toastWarning("Session expires soon"))
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
                .label("Info toast")
            .variant(Variant.INFO)
            .onClick(Alpine.toastInfo("New version available"))
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
        .label("Server-side toast")
            .variant(Variant.PRIMARY)
            .attr("hx-post", "/test/server-toast")
            .attr("hx-swap", "none")
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
        .label("Two toasts")
            .variant(Variant.PRIMARY)
            .onClick(
                Alpine.toastSuccess("First toast"),
                Alpine.toastInfo("Second toast")
            )
            )
            @template.jteui.components.button.button(
            props = new ButtonProps()
        .label("Two toasts")
            .variant(Variant.PRIMARY)
            .onClick(
    Alpine.toastSuccess("Saved"),
    Alpine.toastInfo("Sync started"),
    Alpine.toastWarning("Connection slow"),
    Alpine.toastError("Sync failed")
            )
            )

            @template.jteui.components.button.button(
            props = new ButtonProps()
        .label("Server-side toast")
            .variant(Variant.PRIMARY)
            .applyAction(Action.create()
                .hxPost("/test/server-toast")
            .hxSwap(HtmxSwap.NONE))
            )
        </div>



    </div>

    <div class="mt-12">
        <h2 class="text-2xl font-bold mb-6">Input</h2>

        <div class="space-y-8 p-6 bg-white rounded-lg shadow">

            <!-- Bare input (no wrapper) -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Bare input — no wrapper, just the styled element</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("query")
                .type(InputType.SEARCH)
                .placeholder("Search...")
                )
            </div>

            <!-- Full form field -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Full form field — label, helper, required marker</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("email")
                .type(InputType.EMAIL)
                .label("Email address")
                .helper("We'll never share your email")
                .placeholder("you@example.com")
                .required(true)
                )
            </div>

            <!-- Form field with error (replacing helper) -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Same field with error — helper is replaced</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("email_with_error")
                .type(InputType.EMAIL)
                .label("Email address")
                .helper("We'll never share your email")
                .error("Email is required")
                .value("not-an-email")
                .required(true)
                )
            </div>

            <!-- Three sizes -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Three sizes: SM, MD, LG</p>
                <div class="space-y-3">
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("small")
                        .label("Small")
                    .size(Size.SM)
                    .placeholder("Small input")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("medium")
                        .label("Medium (default)")
                    .size(Size.MD)
                    .placeholder("Medium input")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("large")
                        .label("Large")
                    .size(Size.LG)
                    .placeholder("Large input")
                    )
                </div>
            </div>

            <!-- Disabled and readonly states -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Disabled and readonly</p>
                <div class="space-y-3">
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("disabled_field")
                        .label("Disabled")
                        .value("Can't edit this")
                    .disabled(true)
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("readonly_field")
                        .label("Readonly")
                        .value("View only")
                    .readonly(true)
                    )
                </div>
            </div>

            <!-- Prefix icon -->
            <div>
                <p class="text-sm text-gray-500 mb-2">With prefix icon (search)</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("search_with_icon")
                .type(InputType.SEARCH)
                .placeholder("Search for something..."),
                prefix = @`
                    @template.jteui.components.icon.icon(
                    props = new IconProps().name("search").size(20)
                    )
                `
                )
            </div>

            <!-- Suffix text (units) -->
            <div>
                <p class="text-sm text-gray-500 mb-2">With suffix text (currency unit)</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("amount")
                .type(InputType.NUMBER)
                .label("Amount")
                .placeholder("0.00"),
                suffix = @`EUR`
                )
            </div>

            <!-- Prefix AND suffix -->
            <div>
                <p class="text-sm text-gray-500 mb-2">With both prefix and suffix</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("amount_dual")
                .type(InputType.NUMBER)
                .label("Price")
                .placeholder("0.00"),
                prefix = @`€`,
                suffix = @`EUR`
                )
            </div>

            <!-- Different HTML5 input types -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Various input types</p>
                <div class="space-y-3">
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("password")
                    .type(InputType.PASSWORD)
                    .label("Password")
                    .placeholder("Enter password")
                    .required(true)
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("birthdate")
                    .type(InputType.DATE)
                    .label("Birthdate")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("phone")
                    .type(InputType.TEL)
                    .label("Phone")
                    .placeholder("+49 123 456 7890")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("website")
                    .type(InputType.URL)
                    .label("Website")
                    .placeholder("https://example.com")
                    )
                </div>
            </div>

        </div>
    </div>
    <div class="mt-12">
        <h2 class="text-2xl font-bold mb-6">Input — Validation states</h2>

        <div class="space-y-6 p-6 bg-white rounded-lg shadow">

            <!-- Default (no validation feedback yet) -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Default — no validation yet</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("username_default")
                    .label("Username")
                    .helper("Choose a unique username")
                    .placeholder("yourname")
                )
            </div>

            <!-- Success: green border, green message -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Success state</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("username_ok")
                    .label("Username")
                    .value("alice_42")
                    .success("Available!")
                )
            </div>

            <!-- Warning: amber border, amber message -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Warning state</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("password_weak")
                .type(InputType.PASSWORD)
                .label("Password")
                .value("hunter2")
                .warning("Weak — consider adding a number")
                )
            </div>

            <!-- Error: red border, red message -->
            <div>
                <p class="text-sm text-gray-500 mb-2">Error state</p>
                @template.jteui.components.input.input(
                props = new InputProps()
                    .name("email_invalid")
                .type(InputType.EMAIL)
                .label("Email")
                .value("not-an-email")
                .error("Please enter a valid email address")
                )
            </div>

            <!-- All three side by side at SM size for compact display -->
            <div>
                <p class="text-sm text-gray-500 mb-2">All states at SM size</p>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("sm_ok")
                        .label("Valid")
                    .size(Size.SM)
                    .value("Looks good")
                    .success("Valid")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("sm_warn")
                        .label("Warning")
                    .size(Size.SM)
                    .value("Hmm...")
                    .warning("Check this")
                    )
                    @template.jteui.components.input.input(
                    props = new InputProps()
                        .name("sm_err")
                        .label("Invalid")
                    .size(Size.SM)
                    .value("Bad value")
                    .error("Try again")
                    )
                </div>
            </div>

        </div>
    </div>

`
)



</body>
</html>