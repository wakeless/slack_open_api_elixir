# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Elixir library for Slack API integration, built using OpenAPI code generation. The project uses the `oapi_generator` package to generate API client code from OpenAPI specifications.

## Commands

### Development
- `mix deps.get` - Install dependencies
- `mix compile` - Compile the project
- `mix test` - Run all tests
- `mix format` - Format code according to .formatter.exs

### Testing
- `mix test` - Run the full test suite
- `mix test test/specific_test.exs` - Run a specific test file
- `mix test --trace` - Run tests with detailed output

## Architecture

### Core Structure
- `lib/slack_open_api.ex` - Main module with basic functionality
- `test/` - ExUnit tests with doctests enabled
- `mix.exs` - Project configuration and dependencies

### Code Generation
The project relies on `oapi_generator` for generating Slack API client code from OpenAPI specifications. This is a development-only dependency that generates the actual API interaction code.

### Dependencies
- `oapi_generator ~> 0.2.0` - OpenAPI code generation (dev only)
- Standard Elixir/OTP applications (logger)

## Development Notes

- Code formatting is configured via `.formatter.exs`
- Project targets Elixir ~> 1.17
- Uses ExUnit for testing with doctest support
- Currently contains placeholder/template code that will be replaced by generated API code