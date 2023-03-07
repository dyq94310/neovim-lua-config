return {
  on_setup = function(server)
    server:setup({
      },
      on_attach = function(client, bufnr)
        require("jdtls").start_or_attach(config)
      end,
    })
  end,
}
