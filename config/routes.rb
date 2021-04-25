Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources 'todos'
end
