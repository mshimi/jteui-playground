@import io.github.mshimi.jteui.components.confirmModal.ConfirmModalProps
@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.base.Variant
@import io.github.mshimi.jteui.base.Alpine

@param ConfirmModalProps deleteUser
@param ConfirmModalProps saveChanges
@param ConfirmModalProps discardChanges
@param ConfirmModalProps neutralConfirm

@template.layout(
currentPath = "/components/confirm-modal",
pageTitle = "ConfirmModal — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">ConfirmModal</h1>
        <p class="text-gray-600">
            Confirmation dialogs for actions that need a second thought —
            destructive operations, publishing, discarding work. Built on top
            of Modal with a specific shape: title, message, confirm + cancel buttons.
        </p>
    </header>

    <!-- Destructive (DANGER) -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Destructive action</h2>
        <p class="text-sm text-gray-500 mb-3">
            Red confirm button + irreversible language. Use for delete, archive, ban.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Delete user")
            .variant(Variant.DANGER)
            .onClick(Alpine.openModal("confirm-delete-user"))
            )
        </div>
        @template.jteui.components.confirmModal.confirmModal(props = deleteUser)
    </section>

    <!-- Positive confirmation (SUCCESS) -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Positive confirmation</h2>
        <p class="text-sm text-gray-500 mb-3">
            Green confirm button for actions that have positive but consequential outcomes.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Publish changes")
            .variant(Variant.SUCCESS)
            .onClick(Alpine.openModal("confirm-save-changes"))
            )
        </div>
        @template.jteui.components.confirmModal.confirmModal(props = saveChanges)
    </section>

    <!-- Warning (WARNING) with custom cancel label -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Discard work (warning)</h2>
        <p class="text-sm text-gray-500 mb-3">
            Amber confirm button. Custom cancel label ("Keep editing") makes the
            cancel option more inviting than confirming the loss.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Leave page")
            .variant(Variant.WARNING)
            .onClick(Alpine.openModal("confirm-discard"))
            )
        </div>
        @template.jteui.components.confirmModal.confirmModal(props = discardChanges)
    </section>

    <!-- Neutral (PRIMARY) -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Neutral confirmation</h2>
        <p class="text-sm text-gray-500 mb-3">
            Blue confirm button. Use for actions that need explicit consent but
            aren't destructive or particularly weighty.
        </p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.button.button(
            props = new ButtonProps()
                        .label("Notify team")
            .variant(Variant.PRIMARY)
            .onClick(Alpine.openModal("confirm-neutral"))
            )
        </div>
        @template.jteui.components.confirmModal.confirmModal(props = neutralConfirm)
    </section>

    <!-- Pattern guidance -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Design guidance</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <ul class="space-y-2 text-sm text-gray-700">
                <li><strong>Match the variant to the action's weight.</strong>
                    DANGER for destructive, WARNING for losing work, SUCCESS for positive impact, PRIMARY for neutral.</li>
                <li><strong>State the consequence in the message.</strong>
                    "This cannot be undone" is more useful than "Are you sure?".</li>
                <li><strong>Use specific button labels.</strong>
                    "Delete user" beats "OK". Users skim the buttons more than the message.</li>
                <li><strong>Consider the cancel label.</strong>
                    For risky actions, make cancel inviting ("Keep editing" instead of just "Cancel").</li>
            </ul>
        </div>
    </section>

`
)