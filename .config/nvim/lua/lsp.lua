-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		 require('snippy').expand_snippet(args.body) -- For `snippy` users.
		 --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	  end,
	},
	window = {
	   completion = cmp.config.window.bordered(),
	   documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {"i", "s"}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			--elseif luasnip.expand_or_jumpable() then
				--luasnip.expand_or_jump()
			--elseif has_words_before() then
				--cmp.complete()
			else
				fallback()
			end
		end, {"i", "s"}),
		['<CR>'] = cmp.mapping.confirm({select = true}),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'vsnip' }, -- For vsnip users.
	   --{ name = 'luasnip' }, -- For luasnip users.
	   --{ name = 'ultisnips' }, -- For ultisnips users.
	   { name = 'snippy' }, -- For snippy users.
	}, {
	  { name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require('lspconfig')['pyright'].setup {
capabilities = capabilities
}

local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
