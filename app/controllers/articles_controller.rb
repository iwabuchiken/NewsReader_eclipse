# require 'nokogiri'

require 'basics'
require 'noko_helper'

# module NokoLib
    # def get_xml_base
      # builder = Nokogiri::XML::Builder.new do |xml|
      # end
#       
      # return Nokogiri::XML(builder.to_xml)
    # end#def get_xml_base
# end

class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  
  # require NokoLib
  # include NokoLib
  
  def index
    # require NokoLib
    
    @articles = Article.all
    
    # # @xml_base = NokogiriHelper.get_xml_base
    # @xml_base = get_xml_base()
    # @xml_base = get_xml_base

    #debug
    @message = BASICS::Basic1.new.show_message("basic1")
    # @noko_msg = NokoHelper::NokoHelper.new.show_message
    
    @xml_base = NokoHelper::NokoHelper.new.get_xml_base
    @noko_node = NokoHelper::NokoHelper.new.get_node(@xml_base, "Button")
    
    @xml_base_xml = NokoHelper::NokoHelper.new.get_xml_string(@xml_base)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def get_xml_base
    builder = Nokogiri::XML::Builder.new do |xml|
    end
    
    return Nokogiri::XML(builder.to_xml)
  end#def get_xml_base
    
end#class ArticlesController < ApplicationController

# module NokoLib
    # def get_xml_base
      # builder = Nokogiri::XML::Builder.new do |xml|
      # end
#       
      # return Nokogiri::XML(builder.to_xml)
    # end#def get_xml_base
# end