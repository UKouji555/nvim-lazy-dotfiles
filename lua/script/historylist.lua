local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local function show_history_popup()
  vim.cmd("silent! rshada")
  local files = vim.v.oldfiles
  local list = vim.tbl_map(function(f)
    return vim.fn.fnamemodify(f, ":~")
  end, vim.list_slice(vim.fn.reverse(files), 1, 10))

  if #list == 0 then
    vim.notify("Not history", vim.log.levels.INFO)
    return
  end

  local popup = Popup({
    enter = true,
    focusable = true,
    relative = "editor",
    position = {
      row = math.floor(vim.o.lines * 0.2),
      col = math.floor((vim.o.columns - 60) / 2),
    },
    size = {
      width = 60,
      height = math.max(#list + 2, 5),
    },
    border = {
      style = "rounded",
      text = { top = " Access History Files ", top_align = "center" },
    },
    buf_options = {
      modifiable = true,
      readonly = false,
    },
  })

  popup:mount()
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, list)

  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(popup.winid) then
      vim.api.nvim_set_current_win(popup.winid)
    end
  end, 30)

  vim.keymap.set("n", "<CR>", function()
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local selected_path = files[linenr]
    if vim.fn.filereadable(selected_path) == 1 then
      popup:unmount()
      vim.cmd("edit " .. vim.fn.fnameescape(selected_path))
    else
      vim.notify("Not file: " .. selected_path, vim.log.levels.ERROR)
    end
  end, { buffer = popup.bufnr })

  popup:on({ event.BufLeave, event.WinLeave }, function()
    popup:unmount()
  end)

  vim.keymap.set("n", "<Esc>", function()
    popup:unmount()
  end, { buffer = popup.bufnr, noremap = true, silent = true })
end

vim.api.nvim_create_user_command("ShowHistory", show_history_popup, {})

return {
  show_history_popup = show_history_popup,
}
