return {
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'JavaHello/spring-boot.nvim',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
    },
    config = function()
      require('java').setup()
      local jdtls_config = {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-1.8',
                  path = '/usr/lib/jvm/java-8-openjdk-amd64/',
                  default = true,
                },
              },
            },
            saveActions = {
              organizeImports = true,
            },
            compile = {
              -- seems broken
              nullAnalysis = {
                mode = 'automatic',
              },
            },
          },
        },
      }
      require('lspconfig').jdtls.setup(jdtls_config)
    end,
  },
}
