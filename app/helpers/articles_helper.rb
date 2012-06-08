module ArticlesHelper
  
  def show_message(message)
    "<h3>#{message}<h3>"
  end

  # module NokogiriHelper
    def get_xml_base
      builder = Nokogiri::XML::Builder.new do |xml|
      end
      
      return Nokogiri::XML(builder.to_xml)
    end#def get_xml_base
  # end#module NokogiriHelper
end
