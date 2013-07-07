require 'spec_helper'

describe Topic do
  before do 
  	@topic = Topic.new(title: "this is my topic", body: "this is the topic content")
  end

  subject { @topic }
  it { should respond_to(:title)}
  it { should respond_to(:body)}
  it { should respond_to(:permalink)}

  describe  "without a title" do
  	before { @topic.title = " "}
  	it { should_not be_valid}
  end

  describe  "when title is too short" do
  	before { @topic.title = "a" * 5}
  	it { should_not be_valid}
  end

  describe  "when title is too long" do
  	before { @topic.title = "a" * 30}
  	it { should_not be_valid}
  end

  describe  "without a body" do
  	before { @topic.body = " "}
  	it { should_not be_valid}
  end
end
