@import io.github.mshimi.jteui.components.card.CardProps
@import io.github.mshimi.jteui.components.button.ButtonProps
@import io.github.mshimi.jteui.components.badge.BadgeProps
@import io.github.mshimi.jteui.base.Variant

@param CardProps elevatedCard
@param CardProps outlinedCard
@param CardProps filledCard
@param CardProps paddingNoneCard
@param CardProps paddingSmCard
@param CardProps paddingLgCard
@param CardProps bodyOnlyCard
@param CardProps fullCard

@param CardProps imageInBody
@param CardProps imageInHeader
@param CardProps imageEdgeToEdge
@param CardProps imageAvatar

@template.layout(
currentPath = "/components/card",
pageTitle = "Card — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Card</h1>
        <p class="text-gray-600">
            Flexible container for grouping related content. Three style variants,
            four padding sizes, and three optional content slots (header, body, footer).
        </p>
    </header>

    <!-- Styles -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Styles</h2>
        <p class="text-sm text-gray-500 mb-3">Three visual treatments for different contexts.</p>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

            @template.jteui.components.card.card(
            props = elevatedCard,
            header = @`
                <h3 class="text-base font-semibold">Elevated</h3>
            `,
            body = @`
                <p class="text-sm text-gray-600">
                    Soft shadow that lifts the card above the background.
                    Good for primary content blocks.
                </p>
            `
            )

            @template.jteui.components.card.card(
            props = outlinedCard,
            header = @`
                <h3 class="text-base font-semibold">Outlined</h3>
            `,
            body = @`
                <p class="text-sm text-gray-600">
                    Just a border. Quieter than elevated, more modern.
                    Pairs well with surface-level layouts.
                </p>
            `
            )

            @template.jteui.components.card.card(
            props = filledCard,
            header = @`
                <h3 class="text-base font-semibold">Filled</h3>
            `,
            body = @`
                <p class="text-sm text-gray-600">
                    Soft tinted background, no border. Useful for
                    sections within sections.
                </p>
            `
            )

        </div>
    </section>

    <!-- Padding sizes -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Padding</h2>
        <p class="text-sm text-gray-500 mb-3">Four sizes: NONE, SM, MD (default), LG.</p>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

            @template.jteui.components.card.card(
            props = paddingNoneCard,
            body = @`
                <div class="p-2 text-xs text-gray-500 bg-gray-50">
                    <strong>NONE</strong> — caller owns padding.
                    The card itself adds nothing.
                </div>
            `
            )

            @template.jteui.components.card.card(
            props = paddingSmCard,
            body = @`
                <p class="text-sm">
                    <strong>SM</strong> — tight padding for dense layouts.
                </p>
            `
            )

            @template.jteui.components.card.card(
            props = outlinedCard,
            body = @`
                <p class="text-sm">
                    <strong>MD</strong> (default) — comfortable padding.
                </p>
            `
            )

            @template.jteui.components.card.card(
            props = paddingLgCard,
            body = @`
                <p class="text-sm">
                    <strong>LG</strong> — generous padding for prominent content.
                </p>
            `
            )

        </div>
    </section>

    <!-- Body only -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Body only</h2>
        <p class="text-sm text-gray-500 mb-3">Card with just a body slot — no header, no footer.</p>

        @template.jteui.components.card.card(
        props = bodyOnlyCard,
        body = @`
            <p class="text-gray-700">
                This card has only a body. Useful when the content
                is self-explanatory and doesn't need a header or actions.
            </p>
        `
        )
    </section>

    <!-- Full card with all three slots + nested components -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Full card</h2>
        <p class="text-sm text-gray-500 mb-3">
            All three slots used, with nested jteui components inside —
            Badge in header, Button in footer.
        </p>

        <div class="max-w-md">
            @template.jteui.components.card.card(
            props = fullCard,
            header = @`
                <div class="flex items-center justify-between">
                    <h3 class="text-base font-semibold">User profile</h3>
                    @template.jteui.components.badge.badge(
                    props = new BadgeProps().label("Active").variant(Variant.SUCCESS).dot(true)
                    )
                </div>
            `,
            body = @`
                <div class="space-y-2 text-sm">
                    <p class="text-gray-700"><strong>Name:</strong> Alice Müller</p>
                    <p class="text-gray-700"><strong>Email:</strong> alice@example.com</p>
                    <p class="text-gray-700"><strong>Role:</strong> Administrator</p>
                </div>
            `,
            footer = @`
                <div class="flex justify-end gap-2">
                    @template.jteui.components.button.button(
                    props = new ButtonProps()
                                    .label("Edit")
                    .variant(Variant.OUTLINE)
                    .size(io.github.mshimi.jteui.base.Size.SM)
                    )
                    @template.jteui.components.button.button(
                    props = new ButtonProps()
                                    .label("Delete")
                    .variant(Variant.DANGER)
                    .size(io.github.mshimi.jteui.base.Size.SM)
                    )
                </div>
            `
            )
        </div>
    </section>

    <!-- Image patterns — what's possible today -->
    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Images (current API)</h2>
        <p class="text-sm text-gray-500 mb-6">
            Four ways to include images using the existing header/body/footer slots,
            no library changes needed. The trade-offs vary — see which feels right.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <!-- 1. Image inside body (with padding around it) -->
            <div>
                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide mb-2">
                    1. Image inside body
                </p>
                @template.jteui.components.card.card(
                props = imageInBody,
                header = @`
                    <h3 class="text-base font-semibold">Mountain landscape</h3>
                `,
                body = @`
                    <img src="https://picsum.photos/seed/mountain/600/300"
                         alt="Mountain"
                         class="w-full h-40 object-cover rounded-md mb-3" />
                    <p class="text-sm text-gray-600">
                        Image has card padding around it. Simple, no tricks.
                    </p>
                `
                )
            </div>

            <!-- 2. Image as the header content -->
            <div>
                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide mb-2">
                    2. Image as header (negative margins)
                </p>
                @template.jteui.components.card.card(
                props = imageInHeader,
                header = @`
                    <img src="https://picsum.photos/seed/beach/600/300"
                         alt="Beach"
                         class="w-full h-40 object-cover -mt-4 -mx-4 mb-4 rounded-t-lg" />
                    <h3 class="text-base font-semibold">Beach view</h3>
                `,
                body = @`
                    <p class="text-sm text-gray-600">
                        Image bleeds to card edges via negative margins.
                        Looks clean — but the user has to know to do this.
                    </p>
                `
                )
            </div>

            <!-- 3. Edge-to-edge with Padding.NONE -->
            <div>
                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide mb-2">
                    3. Padding.NONE + manual content padding
                </p>
                @template.jteui.components.card.card(
                props = imageEdgeToEdge,
                body = @`
                    <img src="https://picsum.photos/seed/forest/600/300"
                         alt="Forest"
                         class="w-full h-40 object-cover" />
                    <div class="p-4">
                        <h3 class="text-base font-semibold mb-2">Forest path</h3>
                        <p class="text-sm text-gray-600">
                            Card has no padding; image fills the top.
                            Content gets explicit padding via wrapper div.
                        </p>
                    </div>
                `
                )
            </div>

            <!-- 4. Small avatar/icon inline with content -->
            <div>
                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide mb-2">
                    4. Small avatar inline
                </p>
                @template.jteui.components.card.card(
                props = imageAvatar,
                body = @`
                    <div class="flex items-start gap-3">
                        <img src="https://picsum.photos/seed/alice/80/80"
                             alt="Alice"
                             class="w-12 h-12 rounded-full object-cover flex-shrink-0" />
                        <div>
                            <h3 class="text-base font-semibold">Alice Müller</h3>
                            <p class="text-sm text-gray-600">
                                Avatar lives inside the body — no special handling needed.
                                This pattern works perfectly with the current API.
                            </p>
                        </div>
                    </div>
                `
                )
            </div>

        </div>
    </section>

`
)