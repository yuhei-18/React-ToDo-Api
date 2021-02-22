require 'rails_helper'

RSpec.describe Todo, type: :request do

  let(:name) { 'simple name' }

  before(:all) do
    @todo = Todo.create(:title => "あいさつ", :content => "おはよう")
  end

  context 'Create' do
    it 'データが正しく作成されている事' do
      expect(@todo).to be_valid
    end
  end

  context 'Read' do
    it 'データが正しく読み込まれている事' do
      expect(Todo.find_by_title("あいさつ")).to eq @todo
    end
  end

  context 'Update' do
    it 'データが正しく更新されている事' do
      @todo.update(:content => "こんにちわ")
      expect(Todo.find_by_content("こんにちわ")).to eq @todo
    end
  end

  context 'Delete' do
    it 'データが正しく削除されている事' do
      @todo.destroy
      expect(Todo.count).to eq(0)
    end
  end
end