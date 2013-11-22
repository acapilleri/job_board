require 'test_helper'

class JobFlowsTest < ActionDispatch::IntegrationTest
  fixtures :jobs
  include Capybara::DSL

  test "index has jobs" do
     job = Job.first
     visit root_url(subdomain: 'jobs')
     assert page.has_content?(job.nome_azienda)
     assert page.has_content?(job.titolo)
  end

  test "search jobs" do
     job = Job.first
     job2 = job.dup
     job2.titolo = 'ciao'
     job2.save
     visit root_url(subdomain: 'jobs')

     fill_in 'q', with: 'ciao'
     click_on 'Cerca'

     assert page.has_content?(job.nome_azienda)
     assert_not page.has_content?(job.titolo)
     assert page.has_content?(job2.titolo)
  end


  test "create annuncio" do
     visit root_url(subdomain: 'jobs')
     click_on "Fai un annuncio Gratis"

     job = Job.first
     fill_in :Titlo, job.titolo
     fill_in "Nome Azienda", job.nome_azienda
     fill_in "Sito web", job.sito_web
     fill_in :Titlo, job.titolo
     fill_in :Titlo, job.titolo

  end
end