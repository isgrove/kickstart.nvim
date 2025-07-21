return {
  {
    dir = '~/Documents/repos/projects/chat.nvim/',
    -- '/isgrove/chat.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local chat = require 'chat'

      local function set_keymap(mode, key, func, desc)
        vim.keymap.set(mode, key, func, { desc = desc, noremap = true, silent = true })
      end

      chat.setup {
        system_prompt = 'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks',
        openai_api_key = os.getenv 'OPENAI_API_KEY',
        groq_api_key = os.getenv 'GROQ_API_KEY',
        anthropic_api_key = os.getenv 'ANTHROPIC_API_KEY',
        deepseek_api_key = os.getenv 'DEEPSEEK_API_KEY',
        default_provider = 'anthropic',
        default_model = 'claude-sonnet-4-20250514',
        model_provider = {
          ['claude-sonnet-4-20250514'] = 'anthropic',
          ['claude-opus-4-20250514'] = 'anthropic',
          ['llama-3.1-70b-versatile'] = 'groq',
          ['gpt-4o'] = 'openai',
          ['deepseek-chat'] = 'deepseek',
        },
        max_tokens = 4096,
      }

      set_keymap({ 'n', 'v' }, '<leader>ac', function()
        chat.stream_model_completion()
      end, '[A]I [C]ompletion')

      set_keymap('v', '<leader>ar', function()
        chat.stream_model_completion { replace = true }
      end, '[A]I [R]eplace')

      set_keymap('n', '<leader>an', function()
        chat.change_system_prompt 'new'
      end, '[A]I [N]ew system pompt')

      set_keymap('n', '<leader>ae', function()
        chat.change_system_prompt 'edit'
      end, '[A]I [E]dit system prompt')

      set_keymap('n', '<leader>aq', function()
        chat.cancel()
      end, '[Q]uit AI completion')
    end,
  },
}
