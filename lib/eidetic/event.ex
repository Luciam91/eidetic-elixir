defmodule Eidetic.Event do
  defstruct identifier: nil,
    serial_number: nil,
    type: nil,
    version: nil,
    payload: nil,
    metadata: %{},
    datetime: nil
end
