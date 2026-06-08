do
    Toggle_term = false
    Term_window_global = 0
    Term_buffer = 0
    vim.api.nvim_create_user_command("Terminal",function()
        if not Toggle_term then
            Toggle_term = true
            local curr_window = vim.api.nvim_get_current_win();
            local cursor_position = vim.api.nvim_win_get_cursor(curr_window);
            print(Term_buffer)
            local term_window = vim.api.nvim_open_win(Term_buffer,true,{
                relative='win',
                width=100,
                height=30,
                bufpos={cursor_position[1],cursor_position[2]},
                border = "rounded",
            })

            Term_window_global = term_window

            if Term_buffer == 0 then
                vim.api.nvim_cmd({
                        cmd="terminal",
                    args= {},
                    magic={bar=true,file=false},
                },{})
                Term_buffer = vim.api.nvim_get_current_buf()
            end
        else
            Toggle_term = false
            vim.api.nvim_win_hide(Term_window_global)
        end

   end,
    {})
end



