require('nt-cpp-tools').setup({
    preview = {
        quit = 'q', -- optional keymapping for quit preview
        accept = '<tab>' -- optional keymapping for accept preview
    },
    header_extension = 'h', -- optional
    source_extension = 'cxx', -- optional
    custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = require'nt-cpp-tools.output_handlers'.get_add_to_cpp()
        }
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context) 
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
    }
})

vim.api.nvim_set_keymap('v', '<leader>df', ':TSCppDefineClassFunc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':lua OpenCppFile()<CR>', { noremap = true, silent = true })

function OpenCppFile()
  local header_file = vim.api.nvim_buf_get_name(0)
  local cpp_file = header_file
  cpp_file = cpp_file:gsub("%.h$", ".cpp")
  cpp_file = cpp_file:gsub("%.hpp$", ".cpp")
  local file = io.open(cpp_file, "r")
  if file then
    file:close()
  else
    file = io.open(cpp_file, "w")
    file:write("// Новый файл для кода C++\n")
    file:close()
  end
  vim.cmd('vsp ' .. cpp_file)
end
