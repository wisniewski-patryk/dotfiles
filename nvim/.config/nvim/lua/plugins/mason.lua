vim.pack.add({
    {
      src = "https://github.com/mason-org/mason.nvim"
    }
})

require("mason").setup(
    {
        registries = {
            "github:Crashdummyy/mason-registry",
            "github:mason-org/mason-registry",
        }
    }
)
