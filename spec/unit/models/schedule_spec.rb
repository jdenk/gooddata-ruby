require 'gooddata/models/schedule'

describe GoodData::Schedule do
  before(:each) do
    ConnectionHelper.create_default_connection
  end

  after(:each) do
    GoodData.disconnect
  end

  it 'Will get schedules for process' do
    GoodData.project = 'tk6192gsnav58crp6o1ahsmtuniq8khb'

    proj = GoodData.project

    data = {
        'schedule' => {
            'type' => 'MSETL',
            'timezone' => 'UTC',
            'cron' => '0 15 27 7 *',
            'params' => {
                'PROCESS_ID' => 'f12975d2-5958-4248-9c3d-4c8f2e1f067d',
                'EXECUTABLE' => "#{proj.title}/graph/graph.grf"
            },
            'hiddenParams' => {
                'HPARAM1_NAME' => 'HPARAM1_VALUE'
            }
        }
    }

    sched = GoodData::Schedule.create(data)
    pp sched

    sched.delete
  end
end