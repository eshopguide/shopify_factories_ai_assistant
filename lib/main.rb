require "dotenv/load"
require 'openai'
require 'langchain'
require 'safe_ruby'
require 'pry'

directory_path =  File.expand_path("~/.asdf/installs/ruby/3.2.3/lib/ruby/gems/3.2.0/gems/shopify_api-13.4.0/lib/shopify_api/rest/resources/2023_07")

if Dir.exist?(directory_path)
  @files = Dir.glob(File.join(directory_path, "*"))
else
  puts "Directory does not exist: #{directory_path}"
end

llm = Langchain::LLM::OpenAI.new(
  api_key: ENV["OPENAI_API_KEY"],
  llm_options: {},
  default_options: { chat_completion_model_name: 'gpt-4o' }
)

thread = Langchain::Thread.new

assistant = Langchain::Assistant.new(
  llm: llm,
  thread: thread,
  instructions: "You are a Shopify developer. You are getting a list of shopify resources. You need to generate FactoryBot factories for them with all attributes and associations using ffaker gem",
  tools: [
    Langchain::Tool::FileSystem.new
  ]
)

@files.each do |file_path|
  content = File.open(file_path, "r") { |file|  file.read }
  assistant.add_message content: content
  assistant.add_message content: 'Based on this file generate FactoryBot factory, use ffaker gem to populate each attribute with realistic data. Rank attibutes based on type and importance. Build assosiations and provide some traits. All Factory names should have shopify_ preffix and classname it should be something like ShopifyAPI::Order and group attributes and associations in separate blocks. Please add some traits useful for testing if needed. Please skip comments and add a #frozen_string_literal: true at the top and return just plain text without addin ```ruby ``` clause'
  assistant.run auto_tool_execution: true
  messages = assistant.thread.messages
  file_name = File.basename(file_path)
  File.open("./output/spec/factories/shopify/2023_07/#{file_name}", 'w') { |file| file.write(messages.last.content) }
  sleep 2
end