return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    local mason_jdtls = vim.fn.stdpath 'data' .. '/mason/bin/jdtls'
    local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
    local root_dir = require('lspconfig').util.root_pattern(unpack(root_markers))(vim.fn.expand '%:p')
    if root_dir then
      require('jdtls').start_or_attach {
        cmd = { mason_jdtls },
        root_dir = root_dir,
        init_options = {
          extendedClientCapabilities = {
            inlayHints = {
              enable = true,
            },
          },
        },
        settings = {
          java = {
            inlayHints = {
              parameterNames = {
                enabled = 'all', -- or "literals" for only literal parameter names
              },
              other = {
                enabled = true,
                typeHints = true,
                typeHintsOptions = {
                  showCompactTypeNames = false,
                },
              },
            },
            configuration = {
              updateBuildConfiguration = 'interactive',
            },
            completion = {
              favoriteStaticMembers = {
                'org.hamcrest.MatcherAssert.assertThat',
                'org.hamcrest.Matchers.*',
                'org.hamcrest.CoreMatchers.*',
                'org.junit.jupiter.api.Assertions.*',
                'java.util.Objects.requireNonNull',
                'java.util.Objects.requireNonNullElse',
                'org.mockito.Mockito.*',
              },
            },
            contentProvider = { preferred = 'fernflower' },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
              },
              hashCodeEquals = {
                useJava7Objects = true,
              },
              useBlocks = true,
            },
          },
        },
      }
    end
  end,
}
