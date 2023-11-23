--- Asks a query to the GPT model and sends the response to a chat window in Vim.
-- @function askGPT
local askGPT = function()
  --- Retrieves user input from the command-line.
  -- @tparam string query The query sent to the GPT model.
  local query = vim.fn.input("Query: ")

  --- Checks if the query is empty. If true, returns without performing any action.
  if query == "" then
    return
  else
    --- Sends the query to the chat window in Vim by invoking the `Chat` command.
    -- @param string query The query sent to the GPT model.
    vim.cmd("Chat " .. query)
  end
end

--- Function to interact with GPT chatbot.
-- Prompts the user for an instruction and sends it to the chatbot.
-- @function instructGPT
-- @usage instructGPT()

local instructGPT = function()
  --- Prompt the user for an instruction.
  -- @treturn string The instruction entered by the user.
  local instruct = vim.fn.input("Instruct: ")
  --- If no instruction is entered, the function returns immediately.
  if instruct == "" then
    return
  else
    --- Send the instruction to the chatbot.
    -- @tparam string instruct The instruction to be sent to the chatbot.
    vim.cmd("Chat code_edit " .. instruct)
  end
end

return {
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },

    config = function(_)
      require("codegpt.config")
      -- vim.g["codegpt_openai_api_key"] = os.getenv("OPENAI_API_KEY")
      vim.g["codegpt_openai_api_key"] = ""
      vim.g["codegpt_chat_completions_url"] =
        -- "http://10.10.10.4:2600/v1/chat/completions"
        "http://127.0.0.1:1337/chat/completions"
    end,

    keys = {
      { "<leader>cc", askGPT, desc = "ChatGPT query" },
      {
        "<leader>cc",
        ":Chat<cr>",
        desc = "Code Completions",
        mode = "v",
      },
      {
        "<leader>cd",
        ":Chat doc<cr>",
        desc = "Document code",
        mode = "v",
      },
      {
        "<leader>cD",
        ":Chat debug<cr>",
        desc = "Debug Code",
        mode = "v",
      },
      {
        "<leader>ce",
        ":Chat explain<cr>",
        desc = "Explain Code",
        mode = "v",
      },
      {
        "<leader>ct",
        ":Chat tests<cr>",
        desc = "Write Unit Tests",
        mode = "v",
      },
      {
        "<leader>co",
        ":Chat opt<cr>",
        desc = "Optimize Code",
        mode = "v",
      },
      {
        "<leader>cq",
        ":Chat question<cr>",
        desc = "Question Answering",
        mode = "v",
      },
      {
        "<leader>ci",
        instructGPT,
        desc = "Edit with instruction",
        mode = "v",
      },
    },
  },
}
