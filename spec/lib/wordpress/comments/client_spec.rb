# coding: utf-8
require_relative '../../../../lib/wordpress/comments/client'

describe Wordpress::Comments::Client do

  describe "#initialize" do
    it "stores a URL" do
      client = Wordpress::Comments::Client.new 'http://mashable.com/comments/feed'
      expect(client.url).to eq 'http://mashable.com/comments/feed'
    end
  end
  
  describe "#parse" do

    let(:xml)     { File.read(File.join('spec', 'fixtures', 'feed.xml')) }

    let(:client)  { Wordpress::Comments::Client.new 'http://mashasble.com/comments/feed' }
    let(:comments) { client.parse xml } 
    let(:comment) { comments.first }

    it "extracts the link" do
      link = 'http://mashable.com/2012/07/18/ipad-early-photos/comment-page-1/#comment-18239503'
      expect(comment[:link]).to eq link
    end

    it "extracts the title" do
      title = "Comment on The Earliest Photos of Apple’s iPad Hit the Web by Fido"
      expect(comment[:title]).to eq title
    end
  end
end
