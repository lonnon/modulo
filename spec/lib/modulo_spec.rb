require File.dirname(__FILE__) + '/../spec_helper'

describe 'Modulo' do
  dataset :pages
  
  describe "<r:if_even>" do
    it "should print the tag's contents if we're in an even child" do
      markup = '<r:children:each><r:if_even><r:title /></r:if_even></r:children:each>'
      
      expected = "Child 2"
      
      pages(:parent).should render(markup).as(expected)
    end
  end
  
  describe "<r:unless_even>" do
    it "should not print the tag's contents if we're in an even child" do
      markup = '<r:children:each><r:unless_even><r:title /></r:unless_even></r:children:each>'
    
      expected = "ChildChild 3"
      
      pages(:parent).should render(markup).as(expected)
    end
  end
  
  describe "<r:if_odd>" do
    it "should print the tag's contents if we're in an odd child" do
      markup = '<r:children:each><r:if_odd><r:title /></r:if_odd></r:children:each>'
      
      expected = "ChildChild 3"
      
      pages(:parent).should render(markup).as(expected)
    end
  end

  describe "<r:unless_odd>" do
    it "should not print the tag's contents if we're in an odd child" do
      markup = '<r:children:each><r:unless_odd><r:title /></r:unless_odd></r:children:each>'
      
      expected = "Child 2"
      
      pages(:parent).should render(markup).as(expected)
    end
  end
end
