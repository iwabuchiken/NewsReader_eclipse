require 'basics'
require 'noko_helper'

class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  
  def index
    # require NokoLib
    
    @articles = Article.all

    @try = "try_nokogiri_6"
      
    @html = try_nokogiri_6    # "href" values

    # @try = "try_nokogiri_5"
#       
    # @html = try_nokogiri_5    # "href" values
  
    # @try = "try_nokogiri_4"
#       
    # @html = try_nokogiri_4    # Multiple pages
#     
    # @html = try_nokogiri_3    # Get "a" tags
    
    # @html = try_nokogiri_2  # Open html
    
    # @xml = try_nokogiri_1  
    
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

  # ============ try 4 ========================
  def get_html_doc(url)
    return NokoHelper::HTMLParser.new.open_html(url)
  end#def get_html_doc(url)
  
  def try_nokogiri_4
    # Url
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l"
    
    doc = get_html_doc(url)
    
    tags = doc.css("div ul li a")
    
    # Get new tags
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=1"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags   => 2
    tags_2.each do |tag|
      tags.push(tag)
    end
    
    # Get new tags
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=2"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags
    tags_2.each do |tag|
      tags.push(tag)
    end
    
    # Get new tags          => 3
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=3"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags
    tags_2.each do |tag|
      tags.push(tag)
    end

    # # Iteration
    # 5.times do |i|
      # # Next page
      # # url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=1"
      # # url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=" + i.to_s
      # url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=" + (i + 1).to_s
#       
      # doc = get_html_doc(url)
#       
      # tags_2 = doc.css("div ul li a")
#       
      # # Append new tags
      # tags_2.each do |tag|
        # tags.push(tag)
      # end
    # end
      
    
    return tags
    # return a_tags
    # return doc
  end#def try_nokogiri_4

  # ============ try 5 ========================
  def try_nokogiri_5
    # Url
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l"
    
    doc = get_html_doc(url)
    
    tags = doc.css("div ul li a")
    
    # Get new tags
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=1"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags   => 2
    tags_2.each do |tag|
      tags.push(tag)
    end
    
    # Get new tags
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=2"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags
    tags_2.each do |tag|
      tags.push(tag)
    end
    
    # Get new tags          => 3
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=3"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags
    tags_2.each do |tag|
      tags.push(tag)
    end
    
    return tags
    # return a_tags
    # return doc
  end#def try_nokogiri_5

  # ============ try 6 ========================
  def get_tags()
    # Url
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l"
    
    doc = get_html_doc(url)
    
    tags = doc.css("div ul li a")
    
    # Get new tags
    url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=1"
    doc = get_html_doc(url)
    tags_2 = doc.css("div ul li a")
    
    # Append the new tags   => 2
    tags_2.each do |tag|
      tags.push(tag)
    end
#     
    # # Get new tags
    # url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=2"
    # doc = get_html_doc(url)
    # tags_2 = doc.css("div ul li a")
#     
    # # Append the new tags
    # tags_2.each do |tag|
      # tags.push(tag)
    # end
#     
    # # Get new tags          => 3
    # url = "http://headlines.yahoo.co.jp/hl?c=soci&t=l&p=3"
    # doc = get_html_doc(url)
    # tags_2 = doc.css("div ul li a")
#     
    # # Append the new tags
    # tags_2.each do |tag|
      # tags.push(tag)
    # end
  
    return tags    
  end#def get_tags()
  
  def try_nokogiri_6
    tags = get_tags
    
    # # Modify the tags
    # tags.each do |tag|
      # if tag['href'].start_with?("/hl?")
#         
      # end
      # # tags_new
    # end
    
    return tags
    # return a_tags
    # return doc
  end#def try_nokogiri_6

end#class ArticlesController < ApplicationController

# module NokoLib
    # def get_xml_base
      # builder = Nokogiri::XML::Builder.new do |xml|
      # end
#       
      # return Nokogiri::XML(builder.to_xml)
    # end#def get_xml_base
# end