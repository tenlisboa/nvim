vim.g.SimpylFold_docstring_preview = 1

vim.api.nvim_exec([[
    augroup PythonSettings
        autocmd!
        autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
    augroup END
]], true)

-- Config for files .js, .html e .css
vim.api.nvim_exec([[
    augroup WebDevSettings
        autocmd!
        autocmd BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 softtabstop=2 shiftwidth=2
    augroup END
]], true)

-- Função para ativar o ambiente virtual do pyenv
local pyenv_virtualenv_support = function()
    -- local project_base_dir = vim.fn.system('pyenv root'):gsub('%s*$', '')
    -- local python_version = vim.fn.system('pyenv version-name')
    -- local activate_this = project_base_dir .. '/versions/' .. python_version .. '/bin/activate_this.py'

    -- local result = vim.fn.system('python -c "exec(open(\'' .. activate_this .. '\').read(), dict(__file__=\'' .. activate_this .. '\'))"')

    vim.fn.system('pyenv shell')

    if vim.v.shell_error == 0 then
        print("pyenv virtualenv activated.")
    else
        print("Error activating pyenv virtualenv.")
    end
end

-- Mapear um tecla para ativar o ambiente virtual do pyenv
vim.api.nvim_set_keymap('n', '<Leader>v', ':lua pyenv_virtualenv_support()<CR>', { noremap = true, silent = true })

