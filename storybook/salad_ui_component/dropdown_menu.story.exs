defmodule Storybook.SaladUIComponents.DropdownMenu do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.DropdownMenu

  def function, do: &DropdownMenu.dropdown_menu_content/1

  def imports,
    do: [
      {DropdownMenu, [dropdown_menu: 1, dropdown_menu_trigger: 1]},
      {SaladUI.Menu, [menu: 1, menu_label: 1, menu_separator: 1, menu_item: 1, menu_shortcut: 1, menu_group: 1]},
      {SaladUI.Button, [button: 1]},
      {SaladStorybookWeb.CoreComponents, [icon: 1]}
    ]

  def template do
    """
    <div class="mt-24">
    <.dropdown_menu>
          <.dropdown_menu_trigger>
            <.button variant="outline">Click me</.button>
          </.dropdown_menu_trigger>
    <.psb-variation/>
    </.dropdown_menu>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :menu,
        attributes: %{},
        slots: [
          """
            <.menu class="w-56">
              <.menu_label>Account</.menu_label>
              <.menu_separator />
              <.menu_group>
                <.menu_item>
                  <.icon name="hero-user" class="mr-2 h-4 w-4" />
                  <span>Profile</span>
                  <.menu_shortcut>⌘P</.menu_shortcut>
                </.menu_item>
                <.menu_item>
                  <.icon name="hero-banknotes" class="mr-2 h-4 w-4" />
                  <span>Billing</span>
                  <.menu_shortcut>⌘B</.menu_shortcut>
                </.menu_item>
                <.menu_item>
                  <.icon name="hero-cog-6-tooth" class="mr-2 h-4 w-4" />
                  <span>Settings</span>
                  <.menu_shortcut>⌘S</.menu_shortcut>
                </.menu_item>
              </.menu_group>
              <.menu_separator />
              <.menu_group>
                <.menu_item>
                  <.icon name="hero-users" class="mr-2 h-4 w-4" />
                  <span>Team</span>
                </.menu_item>
                <.menu_item disabled>
                  <.icon name="hero-plus" class="mr-2 h-4 w-4" />
                  <span>New team</span>
                  <.menu_shortcut>⌘T</.menu_shortcut>
                </.menu_item>
              </.menu_group>
            </.menu>
          """
        ]
      },
      %VariationGroup{
        id: :side,
        description: "Dropdown multiple side",
        variations:
          for side <- ~w(left right top bottom) do
            %Variation{
              id: :"#{side}",
              attributes: %{
                side: side
              },
              slots: [
                """
                <.menu>
                Dropdown content #{side}
                </.menu>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :side,
        description: "Dropdown multiple side",
        variations:
          for align <- ~w(start center end) do
            %Variation{
              id: :"#{align}",
              attributes: %{
                align: align
              },
              slots: [
                """
                <.menu>
                Dropdown content #{align}
                </.menu>
                """
              ]
            }
          end
      }
    ]
  end
end
