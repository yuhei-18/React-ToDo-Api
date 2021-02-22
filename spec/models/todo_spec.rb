require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'Create' do
    let(:name) { 'simple name' }
    let(:param) { FactoryBot.create :todo }
    let(:todo) { Todo.create(:title => param.title, :content => param.content) }

    it 'データが正しく作成されている事' do
      expect(todo.title).to eq param.title
      expect(todo.content).to eq param.content
    end
  end
end