@import io.github.mshimi.jteui.components.form.FormFieldProps
@import io.github.mshimi.jteui.components.form.FormProps
@import io.github.mshimi.jteui.components.input.InputProps
@import io.github.mshimi.jteui.components.button.ButtonProps

@param FormProps loginForm
@param FormFieldProps loginEmail
@param InputProps loginEmailInput
@param FormFieldProps loginPassword
@param InputProps loginPasswordInput

@param FormProps regForm
@param FormFieldProps regUsernameField
@param InputProps regUsernameInput
@param FormFieldProps regPasswordField
@param InputProps regPasswordInput
@param FormFieldProps regConfirmField
@param InputProps regConfirmInput

@param FormProps summaryForm
@param FormFieldProps summaryNameField
@param InputProps summaryNameInput
@param FormFieldProps summaryEmailField
@param InputProps summaryEmailInput

@template.layout(
currentPath = "/components/form",
pageTitle = "Form — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Form</h1>
        <p class="text-gray-600">
            HTMX-powered form container with client-side validation, cross-field rules,
            and configurable server-error display.
        </p>
    </header>

    <%-- ── Login form: per-field validation ── --%>
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Per-field validation</h2>
        <p class="text-sm text-gray-500 mb-4">
            Required + format rules. Errors appear next to each field. Try submitting empty.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200 max-w-sm">
            @template.jteui.components.form.form(props = loginForm, body = @`
                @template.jteui.components.form.formField(
                    props = loginEmail,
                    input = @`
                        @template.jteui.components.input.input(props = loginEmailInput)
                    `
                )
                @template.jteui.components.form.formField(
                    props = loginPassword,
                    input = @`
                        @template.jteui.components.input.input(props = loginPasswordInput)
                    `
                )
                <div class="pt-2">
                    @template.jteui.components.button.button(
                        props = new ButtonProps().label("Sign in").type("submit").loadingOnAction(true)
                    )
                </div>
                <div id="login-result" class="mt-3 text-sm text-green-700"></div>
            `)
        </div>
    </section>

    <%-- ── Registration: cross-field rule (password confirmation) ── --%>
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Cross-field rule</h2>
        <p class="text-sm text-gray-500 mb-4">
            Password + confirm field must match. Errors appear per-field AND in the summary banner (BOTH mode).
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200 max-w-sm">
            @template.jteui.components.form.form(props = regForm, body = @`
                @template.jteui.components.form.formField(
                    props = regUsernameField,
                    input = @`
                        @template.jteui.components.input.input(props = regUsernameInput)
                    `
                )
                @template.jteui.components.form.formField(
                    props = regPasswordField,
                    input = @`
                        @template.jteui.components.input.input(props = regPasswordInput)
                    `
                )
                @template.jteui.components.form.formField(
                    props = regConfirmField,
                    input = @`
                        @template.jteui.components.input.input(props = regConfirmInput)
                    `
                )
                <div class="pt-2">
                    @template.jteui.components.button.button(
                        props = new ButtonProps().label("Create account").type("submit").loadingOnAction(true)
                    )
                </div>
                <div id="reg-result" class="mt-3 text-sm text-green-700"></div>
            `)
        </div>
    </section>

    <%-- ── Summary-only display (SUMMARY mode) ── --%>
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-1">Summary banner only</h2>
        <p class="text-sm text-gray-500 mb-4">
            <code>ServerErrorDisplay.SUMMARY</code>: client-side errors are shown per-field;
            server errors appear only in the top banner.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200 max-w-sm">
            @template.jteui.components.form.form(props = summaryForm, body = @`
                @template.jteui.components.form.formField(
                    props = summaryNameField,
                    input = @`
                        @template.jteui.components.input.input(props = summaryNameInput)
                    `
                )
                @template.jteui.components.form.formField(
                    props = summaryEmailField,
                    input = @`
                        @template.jteui.components.input.input(props = summaryEmailInput)
                    `
                )
                <div class="pt-2">
                    @template.jteui.components.button.button(
                        props = new ButtonProps().label("Send message").type("submit").loadingOnAction(true)
                    )
                </div>
                <div id="summary-result" class="mt-3 text-sm text-green-700"></div>
            `)
        </div>
    </section>

`
)
