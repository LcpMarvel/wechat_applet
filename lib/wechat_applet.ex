defmodule WechatApplet do
  @moduledoc """
  Documentation for WechatApplet.
  """

  @doc """
  Verify the data of user.
  """
  @spec user_data_verify(binary, binary, binary) :: boolean
  def user_data_verify(rawData, session_key, signature) do
    signature == :crypto.hash(:sha, rawData <> session_key)
      |> Base.encode16(case: :lower)
  end

  @doc """
  Decode the data which encoded in AES-128-CBC with PKCS#7 padding.
  """
  @spec user_data_decode(binary, binary, binary) :: binary
  def user_data_decode(encrypted_data, session_key, iv) do
    data = Base.decode64!(encrypted_data)
    key = Base.decode64!(session_key)
    iv = Base.decode64!(iv)

    :crypto.block_decrypt(:aes_cbc128, key, iv, data)
      |> depad
      |> Poison.decode!
  end

  @doc false
  @spec depad(binary) :: binary
  defp depad(data) do
    <<last>> = String.last(data)

    String.rstrip(data, last)
  end
end
