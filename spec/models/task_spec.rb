require 'rails_helper'

RSpec.describe Task, type: :model do
  subject do
    described_class.new(title: 'test title',
                        content: 'test content',
                        status: 'pending',
                        end_at: (Date.today..))
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid whithout a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a status' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'is valid end_at can be nil' do
    subject.end_at = nil
    expect(subject).to be_valid
  end

  it 'can search by title' do
    subject.save
    result = Task.ransack(title_cont: 'test').result
    expect(result.first.title).to eq 'test title'
  end

  it 'can search by content' do
    subject.save
    result = Task.ransack(content_cont: 'test').result
    expect(result.first.content).to eq 'test content'
  end
end
