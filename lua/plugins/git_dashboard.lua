return {
    "juansalvatore/git-dashboard-nvim",
    branch = "main",
    version = "v0.0.8-alpha",
    pin=true,

    config = function ()
        require('git-dashboard-nvim').setup{
            fallback_header = "No repo to display",
            top_padding = 0,
            bottom_padding = 0,
            use_git_username_as_author = true,
            author = "",
            branch = "main",  -- use_current_branch has higher precedence
            gap = " ",
            centered = true,
            day_label_gap = ': ',

            hide_cursor = false,
            is_horizontal = true,
            show_contributions_count = true,
            show_only_weeks_with_commits = false,
            title = "owner_with_repo_name",
            show_current_branch = false,
            use_current_branch = true,

            empty = "x",
            empty_square = "□",
            filled_squares = {'', '', '', '', '', ''},

            days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"},
            months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"},
            basepoints = {"master", "main" },

            colors = {
                dashboard_title = "#88C0D0", -- "#a3cc96"
                branch_highlight = "#88C0D0", -- "#8DC07C"

                days_and_months_labels = "#FF80BF",
                empty_square_highlight = "#7EAC6F",

                filled_square_highlights = {'#2A3925', '#54734A', '#7EAC6F', '#98C689', '#AFD2A3', '#BAD9B0'},
            }
        }
    end
}
