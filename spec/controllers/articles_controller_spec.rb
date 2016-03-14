#require 'spec_helper'
require 'rails_helper'

describe ArticlesController do
  describe "GET #index" do
    it "populates an array of articles" do
    article = FactoryGirl.create(:article)
    get :index
    assigns(:article).should eql?([article])
    end

    it "renders the :index view" do
    get :index
    response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested article to @article" do
      article = FactoryGirl.create(:article)
      get :show, id: article
      assigns(:article).should eql?(article)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:article)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Article to @article" do
      article = FactoryGirl.create(:article)
      get :new
      assigns(:article).should eql?(article)
    end
    it "renders the :new view"  do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new article" do
        expect{
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article,:count).by(1)
      end
      it "redirects to the new article" do
        post :create, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to Article.last
      end
    end  

    context "with invalid attributes" do
      it "does not save the new article" do
        expect{
        post :create, article: FactoryGirl.attributes_for(:invalid_article)
        }.to_not change(Article,:count)
      end

      it "re-renders the new method" do
        post :create, article: FactoryGirl.attributes_for(:invalid_article)
        response.should render_template :new  
      end  
    end 
  end 

  describe 'PUT update' do
    before :each do
      @article = FactoryGirl.create(:article, title: "Plane", text: "Helicopter")
    end

    context "valid attributes" do
      it "located the requested @article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        assigns(:article).should eql?(@article)      
      end
    
      it "changes @article's  attributes" do
        put :update, id: @article, 
          article: FactoryGirl.attributes_for(:article, title: "Plane", text: "Helicopter")
        @article.reload
        @article.title.should eql?("Plane")
        @article.text.should eql?("Helicopter")
      end
  
      it "redirects to the updated article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to @article
      end
    end

    context "invalid attributes" do
      it "locates the request @article"do
       put :update, id: @article ,article:FactoryGirl.attributes_for(:invalid_article)
       assigns(:article).should eql?(@article)
      end

      it "does not change @article's attributes" do
        put :update, id: @article, 
          article: FactoryGirl.attributes_for(:article, title: "Larry", text: nil)
        @article.reload
        @article.title.should_not eql?("plane")
        @article.text.should eql?("helicopter")
      end
      
      it "re-renders the edit method" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:invalid_article)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @article = FactoryGirl.create(:article)
    end
  
    it "deletes the article" do
      expect{
        delete :destroy , id: @article        
      }.to change(Article,:count).by(-1)
    end
    
    it "redirects to articles#index" do
      delete :destroy, id: @article
      response.should redirect_to articles_path
    end
  end    
end
