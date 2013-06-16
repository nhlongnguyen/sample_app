require 'rubygems'
require 'hpricot'
require 'mechanize'
require 'open-uri'

def getElementByStyle (url, style)
	agent = Mechanize.new{
		|agent|
		agent.user_agent_alias = "Windows Mozilla"
	}
	agent.get url
	doc = Hpricot(agent.page.body)
	doc.search("#{style}").reverse.each {|d| puts d.inner_html.gsub(/&[a-z]*;/, '')}

end

getElementByStyle("http://onet.pl/", ".newsTitle")