module Modulo
  include Radiant::Taggable

  # Override original tag to add an index member
  tag 'children:each' do |tag|
    options = children_find_options(tag)
    result = []
    children = tag.locals.children
    tag.locals.previous_headers = {}
    kids = children.find(:all, options)
    kids.each_with_index do |item, i|
      tag.locals.child = item
      tag.locals.page = item
      tag.locals.first_child = i == 0
      tag.locals.last_child = i == kids.length - 1
      tag.locals.index = i
      result << tag.expand
    end
    result
  end


  desc %{
    Renders the contained elements only if the current contextual page
    is an even-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "if_even" do |tag|
    tag.expand if (tag.locals.index + 1) % 2 == 0
  end
  
  desc %{
    Renders the contained elements unless the current contextual page
    is an even-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "unless_even" do |tag|
    tag.expand unless (tag.locals.index + 1) % 2 == 0
  end
  
  desc %{
    Renders the contained elements only if the current contextual page
    is an odd-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_odd [status="published"]>...</r:if_odd></code></pre>
  }
  tag "if_odd" do |tag|
    tag.expand if (tag.locals.index + 1) % 2 != 0
  end
  
  desc %{
    Renders the contained elements unless the current contextual page
    is an odd-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "unless_odd" do |tag|
    tag.expand unless (tag.locals.index + 1) % 2 != 0
  end
end
