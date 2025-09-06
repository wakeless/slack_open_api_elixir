defmodule SlackOpenApi.Web.ObjsFileShares do
  @moduledoc """
  Provides struct and type for a ObjsFileShares
  """

  @type t :: %__MODULE__{
          private: SlackOpenApi.Web.ObjsFileSharesPrivate.t() | nil,
          public: SlackOpenApi.Web.ObjsFileSharesPublic.t() | nil
        }

  defstruct [:private, :public]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      private: {SlackOpenApi.Web.ObjsFileSharesPrivate, :t},
      public: {SlackOpenApi.Web.ObjsFileSharesPublic, :t}
    ]
  end
end
