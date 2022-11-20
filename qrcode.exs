Mix.install([
  :eqrcode
])

qr_code_png =
  System.argv()
  |> hd()
  |> EQRCode.encode()
  |> EQRCode.png()

File.write("qrcode.png", qr_code_png, [:binary])
