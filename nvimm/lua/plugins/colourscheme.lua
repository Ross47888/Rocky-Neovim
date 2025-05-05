local ok, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not ok then
  vim.notify("oxocarbon colorscheme not found!", vim.log.levels.WARN)
end
-- vim.cmd.colorscheme "oxocarbon"
