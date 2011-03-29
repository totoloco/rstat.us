class Rstatus

  get "/rsd.xml" do
    content_type 'application/xml'
    <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<rsd version="1.0" xmlns="http://archipelago.phrasewise.com/rsd">
 <service>
   <engineName>rstat.us</engineName>
   <engineLink>http://localhost:9292/</engineLink>
   <apis>
     <api name="Atom" preferred="false" apiLink="http://localhost:9292/statusnet/app/service.xml" blogID=""></api>
   </apis>
 </service>
</rsd>
    XML
  end

  get "/statusnet/account/verify_credentials.xml" do
    content_type 'application/xml'

    #puts "params length: #{params.length}"
    params.collect{|k, v| puts "#{k}/#{v}\n"; "#{k}/#{v}\n" }
  end

  get "/statusnet/statusnet/version.xml" do
    content_type 'application/xml'

    <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<version>0.9.7</version>
    XML
  end

  get "/statusnet/statusnet/config.xml" do
    content_type 'application/xml'

    <<-XML
  <?xml version="1.0" encoding="UTF-8"?>
  <config>
   <site>
    <name>rstat.us</name>
    <server>http://localhost:9292/</server>
    <theme></theme>
    <path></path>
    <logo>https://identi.ca/theme/identica/logo.png</logo>
    <fancy>true</fancy>
    <language>en</language>
    <email>steve@steveklabnik.com</email>
    <timezone>UTC</timezone>
    <closed>false</closed>
    <inviteonly>false</inviteonly>
    <private>false</private>
    <textlimit>140</textlimit>
    <ssl>never</ssl>
  </site>
   <license>
    <type>cc</type>
    <owner></owner>
    <url>http://creativecommons.org/licenses/by/3.0/</url>
    <title>Creative Commons Attribution 3.0</title>
    <image>http://i.creativecommons.org/l/by/3.0/80x15.png</image>
  </license>
   <nickname>
    <featured></featured>
  </nickname>
   <profile>
    <biolimit></biolimit>
  </profile>
   <group>
    <desclimit></desclimit>
  </group>
   <notice>
    <contentlimit></contentlimit>
  </notice>
   <throttle>
    <enabled>true</enabled>
    <count>20</count>
    <timespan>600</timespan>
  </throttle>
   <xmpp>
    <enabled>false</enabled>
  </xmpp>
   <attachments>
    <uploads>false</uploads>
  </attachments>
  </config>
    XML

  end

  # uses basic auth
  get "/statusnet/statuses/friends_timeline.atom" do
    content_type 'application/rss+xml'
    feed = Feed.first
    body feed.atom(uri("/"))
  end

  get "/statusnet/statuses/user_timeline.atom" do
    content_type 'application/rss+xml'
    feed = Feed.first
    body feed.atom(uri("/"))
  end

  get "/statusnet/statuses/mentions.atom" do
    content_type 'application/rss+xml'
    feed = Feed.first
    body feed.atom(uri("/"))
  end

  get "/statusnet/search.atom" do
    #?q=hello
    content_type 'application/rss+xml'
    feed = Feed.first
    body feed.atom(uri("/"))
  end

  post "/statusnet/statuses/update.xml" do
    #status/thestatustext
    #source/StatusNet Desktop
    content_type 'application/rss+xml'
    feed = Feed.first
    body feed.atom(uri("/"))
  end

  get "/statusnet/statuses/public_timeline.atom" do
    content_type 'application/rss+xml'
    #erb :statusnet_timeline
    feed = Feed.first
    body feed.atom(uri("/"))
  end

end
