return {
    "danymat/neogen",
    config = function()
        require("neogen").setup {
            enabled = true,
            input_after_comment = true, -- Moves cursor to input after generating
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings" -- Use Google-style docstrings
                    }
                }
            }
        }
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Neogen requires Treesitter
	version = "*",
}
