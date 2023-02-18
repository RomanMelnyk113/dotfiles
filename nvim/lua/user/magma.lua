local status_ok, magma = pcall(require, "magma")
if not status_ok then
  return
end


-- NOTE: following packages need to be installed fisrt
-- >> pip3 install timg Pillow cairosvg pnglatex plotly kaleido
magma.setup()

vim.g.magma_automatically_open_output = false
-- vim.g.magma_image_provider = "timg"
