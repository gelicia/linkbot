require 'cinch'

class IRCConnector < Linkbot::Connector
  Linkbot::Connector.register('irc', self)

  def initialize(options)
    super(options)
    @username = @options["username"]
    @password = @options["password"]
    @server = @options["server"]
    @channels = @options["rooms"]
    @connection = nil

    listen
  end
  
  def listen
    bot = Cinch::Bot.new do
	  configure do |c|
	    c.server = @server
	    c.channels = [@channels]
      c.nick = @username
    end
  end

    bot.start
	end

	
end
