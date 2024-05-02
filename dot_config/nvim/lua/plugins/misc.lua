return {
    -- copilot (this is the plugin that kills my intro screen)
    {
        "github/copilot.vim",
        config = function()
            vim.keymap.set('i', '<C-CR>', 'copilot#Accept("\\<CR>")', {
              expr = true,
              replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
	end
    },
    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
