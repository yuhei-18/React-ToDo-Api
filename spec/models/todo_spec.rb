require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'Create' do
    let(:name) { 'simple name' }
    let(:param) { FactoryBot.create :todo }
    let(:todo) { Todo.create(:title => param.title, :content => param.content, :priority => param.priority, :due_date => param.due_date) }

    it 'データが正しく作成されている事' do
      expect(todo.title).to eq param.title
      expect(todo.content).to eq param.content
      expect(todo.priority).to eq param.priority
      expect(todo.due_date).to eq param.due_date
      expect(todo.is_done).to eq false
    end
  end
end