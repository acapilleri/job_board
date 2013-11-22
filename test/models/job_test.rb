require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    jobs = fixtures_as_param :jobs
    @job = Job.new(jobs[:job])
  end

  def test_is_valid
    assert @job.valid?
  end

  def test_titolo
    @job.titolo = nil
    assert_not  @job.valid?
  end

  def test_descrizione
    @job.descrizione = nil
    assert_not  @job.valid?
  end

  def test_nome_azienda
    @job.nome_azienda = nil
    assert_not  @job.valid?
  end

  def test_nome_azienda
     @job.user_id = nil
     assert_not  @job.valid?
   end

   def test_email
      @job.email = 'ckdl.ldk'
      assert_not  @job.valid?
    end

    def test_sito_web
      @job.sito_web = 'http://www.google.com'
      assert_not  @job.valid?
    end
end
