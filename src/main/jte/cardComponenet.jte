@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.components.badge.BadgeProps
@import io.github.mshimi.jteui.components.card.CardProps

@param CardProps cardProps

<div>

    <h2 class="text-xl font-bold mt-8 mb-4">Card</h2>

    @template.jteui.components.card.card(
    props = cardProps,
    header = @`
        <h3 class="font-semibold text-lg">User profile</h3>
        <p class="text-sm text-gray-500">Manage your account settings</p>
    `,
    body = @`
        <p class="text-gray-700">
            This is the card body. It can contain any content, including
            <strong>HTML</strong> and even other jteui components.
        </p>
        <div class="mt-4">
            @template.jteui.components.badge.badge(
            props = new BadgeProps().label("Active").variant(io.github.mshimi.jteui.base.Variant.SUCCESS).dot(true)
            )
        </div>
    `,
    footer = @`
        <div class="flex justify-end gap-2">
            @template.jteui.components.button.button(
            props = new ButtonProps().label("Cancel").variant(io.github.mshimi.jteui.base.Variant.OUTLINE).size(io.github.mshimi.jteui.base.Size.SM)
            )
            @template.jteui.components.button.button(
            props = new ButtonProps().label("Save").variant(io.github.mshimi.jteui.base.Variant.PRIMARY).size(io.github.mshimi.jteui.base.Size.SM)
            )
        </div>
    `
    )

</div>