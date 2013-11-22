xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Top Developer Jobs"
    xml.description "Annunci lavoro per sviluppatori e hacker"
    xml.link "/"

    for job in @jobs
      xml.item do
        xml.title job.titolo
        xml.description "#{job.titolo} #{job.nome_azienda}"
        xml.pubDate job.created_at.to_s(:rfc822)
        xml.link url_for(job)
        xml.guid url_for(job)
        xml.icon asset_path "favicon.ico"
      end
    end
  end
end


