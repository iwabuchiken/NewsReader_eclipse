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
    
    @html = try_nokogiri_3    # Get "a" tags
    
    # @html = try_nokogiri_2  # Open html
    
    # @xml = try_nokogiri_1  
    
    # # @xml_base = NokogiriHelper.get_xml_base
    # @xml_base = get_xml_base()
    # @xml_base = get_xml_base

    # #debug
    # @message = BASICS::Basic1.new.show_message("basic1")
    # # @noko_msg = NokoHelper::NokoHelper.new.show_message
#     
    # @xml_base = NokoHelper::NokoHelper.new.get_xml_base
    # @noko_node = NokoHelper::NokoHelper.new.get_node(@xml_base, "Button")
#     
    # @xml_base_xml = NokoHelper::NokoHelper.new.get_xml_string(@xml_base)
#     
    # # Add sub
    # NokoHelper::NokoHelper.new.add_child(@xml_base_xml, @noko_node)
    
    # Add attributes
    # NokoHelper::NokoHelper.new.set_attribute(@noko_node, "")
    
    
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
    
  def try_nokogiri_1
    # NokoHelper
    noko_helper = NokoHelper::NokoHelper.new
    
    # Get base
    xml_base = NokoHelper::NokoHelper.new.get_xml_base
    
    # Get node
    node1 = noko_helper.get_node(xml_base, "LinearLayout")
    
    # Add child
    noko_helper.add_child(xml_base, node1)
    
    # Set attributes
    noko_helper.set_attribute(
            node1, 
            "xmlns:android", "http://schemas.android.com/apk/res/android")
    
    # Add another child
    # node2 = noko_helper.get_node(xml_base, "Button")
    # noko_helper.set_attribute(
            # node2, 
            # "android:orientation", "vertical")
    # # noko_helper.add_child(xml_base, node2)
    # noko_helper.add_next_sibling(xml_base, node2)
    
    return xml_base
     
  end#def try_nokogiri_1

  def try_nokogiri_2
    return NokoHelper::HTMLParser.new.open_html("http://headlines.yahoo.co.jp/hl?c=soci&t=l")
  end#def try_nokogiri_2
  
  def try_nokogiri_3
    doc = try_nokogiri_2
    
    # a_tags = doc.xpath("//a")
    # a_tags = doc.css("//a")
    
    tags = doc.css("div ul li a")
    
    return tags
    # return a_tags
    # return doc
  end

end#class ArticlesController < ApplicationController

# module NokoLib
    # def get_xml_base
      # builder = Nokogiri::XML::Builder.new do |xml|
      # end
#       
      # return Nokogiri::XML(builder.to_xml)
    # end#def get_xml_base
# end