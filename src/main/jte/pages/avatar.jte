@import io.github.mshimi.jteui.components.avatar.AvatarGroupProps
@import io.github.mshimi.jteui.components.avatar.AvatarProps
@import java.util.List

@param List<AvatarProps> sizes
@param List<AvatarProps> withImages
@param List<AvatarProps> initials
@param List<AvatarProps> shapes
@param List<AvatarProps> withStatus
@param AvatarProps imageWithStatus
@param AvatarGroupProps group
@param AvatarGroupProps groupWithOverflow

@template.layout(
currentPath = "/components/avatar",
pageTitle = "Avatar — jteui",
content = @`

    <header class="mb-10">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Avatar</h1>
        <p class="text-gray-600">
            User image or initials fallback. Optional status dot for presence.
        </p>
    </header>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Sizes</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4">
                @for(var a : sizes)
                    @template.jteui.components.avatar.avatar(props = a)
                @endfor
            </div>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">With images</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4">
                @for(var a : withImages)
                    @template.jteui.components.avatar.avatar(props = a)
                @endfor
            </div>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Initials fallback</h2>
        <p class="text-sm text-gray-500 mb-3">When no image is provided, initials show against a gray background.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4">
                @for(var a : initials)
                    @template.jteui.components.avatar.avatar(props = a)
                @endfor
            </div>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Shapes</h2>
        <p class="text-sm text-gray-500 mb-3">CIRCLE (default) or SQUARE.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4">
                @for(var a : shapes)
                    @template.jteui.components.avatar.avatar(props = a)
                @endfor
            </div>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">With status dot</h2>
        <p class="text-sm text-gray-500 mb-3">SUCCESS (online), WARNING (away), DANGER (busy), SECONDARY (offline).</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-4">
                @for(var a : withStatus)
                    @template.jteui.components.avatar.avatar(props = a)
                @endfor
            </div>
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Group</h2>
        <p class="text-sm text-gray-500 mb-3">Overlapping avatars with a white ring separating each.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.avatar.avatarGroup(props = group)
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Group with overflow</h2>
        <p class="text-sm text-gray-500 mb-3">When more avatars exist than {@code max}, a "+N" bubble appears.</p>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            @template.jteui.components.avatar.avatarGroup(props = groupWithOverflow)
        </div>
    </section>

    <section class="mb-10">
        <h2 class="text-lg font-semibold text-gray-900 mb-4">Image + status (real-world)</h2>
        <div class="p-6 bg-white rounded-lg border border-gray-200">
            <div class="flex items-center gap-3">
                @template.jteui.components.avatar.avatar(props = imageWithStatus)
                <div>
                    <p class="font-medium text-gray-900">Alice Müller</p>
                    <p class="text-sm text-gray-500">Online · Last active just now</p>
                </div>
            </div>
        </div>
    </section>

`
)
