require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "posts", :action => "index").should == "/posts"
    end
  
    it "maps #new" do
      route_for(:controller => "posts", :action => "new").should == "/posts/new"
    end
  
    it "maps #show" do
      route_for(:controller => "posts", :action => "show", :id => "1").should == "/posts/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "posts", :action => "edit", :id => "1").should == "/posts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "posts", :action => "create").should == {:path => "/posts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "posts", :action => "update", :id => "1").should == {:path =>"/posts/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "posts", :action => "destroy", :id => "1").should == {:path =>"/posts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/posts").should == {:controller => "posts", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/posts/new").should == {:controller => "posts", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/posts").should == {:controller => "posts", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/posts/1").should == {:controller => "posts", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/posts/1/edit").should == {:controller => "posts", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/posts/1").should == {:controller => "posts", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/posts/1").should == {:controller => "posts", :action => "destroy", :id => "1"}
    end
  end
end
