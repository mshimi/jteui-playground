@import io.github.mshimi.jteui.components.modal.ModalProps
@import io.github.mshimi.jteui.components.form.FormProps
@import io.github.mshimi.jteui.components.form.FormFieldProps
@import io.github.mshimi.jteui.components.input.InputProps
@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.base.Alpine
@import io.github.mshimi.jteui.base.Variant

@param ModalProps editModal
@param FormProps profileForm
@param FormFieldProps nameField
@param InputProps nameInput
@param FormFieldProps emailField
@param InputProps emailInput
@param String currentName
@param String currentEmail

@template.layout(
currentPath = "/components/form-in-modal",
pageTitle = "Form in Modal — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Form in Modal</h1>
        <p class="text-gray-600">
            Click <strong>Edit profile</strong> to open the modal. The form validates
            client-side before submitting. On success the profile card updates in place
            and the modal closes. On error the form shows field-level messages.
        </p>
    </header>

    <%-- ── Profile card — HTMX swaps outerHTML on success ── --%>
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Profile card</h2>
        <p class="text-sm text-gray-500 mb-4">
            Try submitting with an email ending in
            <code class="bg-gray-100 px-1 py-0.5 rounded text-xs">blocked.com</code>
            to see server-side validation. The domain
            <code class="bg-gray-100 px-1 py-0.5 rounded text-xs">blocked.com</code>
            triggers a 400 response with a field error from the server.
        </p>
        <div class="max-w-sm">
            @template.pages.fragments.profileCard(name = currentName, email = currentEmail)
        </div>
    </section>

    <%-- ── Edit modal — rendered once, controlled by Alpine store ── --%>
    @template.jteui.components.modal.modal(
    props = editModal,
    header = @`
        <h3 class="text-lg font-semibold text-gray-900">Edit profile</h3>
        <p class="text-sm text-gray-500 mt-0.5">Update your name and email address.</p>
    `,
    body = @`
        @template.jteui.components.form.form(props = profileForm, body = @`

            @template.jteui.components.form.formField(
                props = nameField,
                input = @`
                    @template.jteui.components.input.input(props = nameInput)
                `
            )

            @template.jteui.components.form.formField(
                props = emailField,
                input = @`
                    @template.jteui.components.input.input(props = emailInput)
                `
            )

            <div class="flex justify-end gap-2 pt-4 mt-2 border-t border-gray-100">
                @template.jteui.components.button.button(
                    props = new ButtonProps()
                        .label("Cancel")
                        .variant(Variant.OUTLINE)
                        .onClick(Alpine.closeModal("edit-profile-modal"))
                )
                @template.jteui.components.button.button(
                    props = new ButtonProps()
                        .label("Save changes")
                        .type("submit")
                        .loadingOnAction(true)
                )
            </div>

        `)
    `
    )

`
)
