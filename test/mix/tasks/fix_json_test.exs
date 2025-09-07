defmodule Mix.Tasks.FixJsonTest do
  use ExUnit.Case

  import Mix.Tasks.FixJson, only: [fix_endpoints: 1]

  describe "fix_endpoints/1" do
    test "converts GET endpoints with application/json content type to POST" do
      spec = %{
        "paths" => %{
          "/views.open" => %{
            "get" => %{
              "description" => "Open a view for a user.",
              "operationId" => "views_open",
              "parameters" => [
                %{
                  "description" => "Exchange a trigger to post to the user.",
                  "in" => "query",
                  "name" => "trigger_id",
                  "required" => true,
                  "schema" => %{"type" => "string"}
                },
                %{
                  "description" => "A view payload. This must be a JSON-encoded string.",
                  "in" => "query",
                  "name" => "view",
                  "required" => true,
                  "schema" => %{"type" => "string"}
                }
              ],
              "responses" => %{
                "200" => %{
                  "content" => %{
                    "application/json" => %{
                      "schema" => %{
                        "type" => "object",
                        "properties" => %{"ok" => %{"type" => "boolean"}}
                      }
                    }
                  }
                }
              }
            }
          },
          "/views.publish" => %{
            "get" => %{
              "description" => "Publish a static view for a User.",
              "operationId" => "views_publish",
              "parameters" => [
                %{
                  "description" => "id of the user you want publish a view to.",
                  "in" => "query",
                  "name" => "user_id",
                  "required" => true,
                  "schema" => %{"type" => "string"}
                },
                %{
                  "description" => "A view payload. This must be a JSON-encoded string.",
                  "in" => "query",
                  "name" => "view",
                  "required" => true,
                  "schema" => %{"type" => "string"}
                }
              ],
              "responses" => %{
                "200" => %{
                  "content" => %{
                    "application/json" => %{
                      "schema" => %{
                        "type" => "object",
                        "properties" => %{"ok" => %{"type" => "boolean"}}
                      }
                    }
                  }
                }
              }
            }
          },
          "/some.other" => %{
            "get" => %{
              "description" => "Some other endpoint that should remain GET",
              "operationId" => "some_other",
              "parameters" => [],
              "responses" => %{
                "200" => %{
                  "content" => %{
                    "text/plain" => %{
                      "schema" => %{"type" => "string"}
                    }
                  }
                }
              }
            }
          }
        }
      }

      fixed_spec = fix_endpoints(spec)

      # views.open should be converted to POST
      assert %{"post" => _} = get_in(fixed_spec, ["paths", "/views.open"])
      refute get_in(fixed_spec, ["paths", "/views.open", "get"])

      # views.publish should be converted to POST
      assert %{"post" => _} = get_in(fixed_spec, ["paths", "/views.publish"])
      refute get_in(fixed_spec, ["paths", "/views.publish", "get"])

      # some.other should remain GET since it doesn't have application/json
      assert get_in(fixed_spec, ["paths", "/some.other", "get"])
      refute get_in(fixed_spec, ["paths", "/some.other", "post"])

      # Check that POST method has proper request body
      views_open_post = get_in(fixed_spec, ["paths", "/views.open", "post"])
      assert views_open_post["requestBody"]
      assert views_open_post["requestBody"]["content"]["application/x-www-form-urlencoded"]

      views_publish_post = get_in(fixed_spec, ["paths", "/views.publish", "post"])
      assert views_publish_post["requestBody"]
      assert views_publish_post["requestBody"]["content"]["application/x-www-form-urlencoded"]
    end

    test "handles endpoints with no response content types" do
      spec = %{
        "paths" => %{
          "/test.endpoint" => %{
            "get" => %{
              "description" => "Test endpoint",
              "operationId" => "test_endpoint",
              "parameters" => [],
              "responses" => %{
                "200" => %{
                  "description" => "Success"
                }
              }
            }
          }
        }
      }

      fixed_spec = fix_endpoints(spec)

      # Should remain GET since no application/json content type
      assert get_in(fixed_spec, ["paths", "/test.endpoint", "get"])
      refute get_in(fixed_spec, ["paths", "/test.endpoint", "post"])
    end
  end
end