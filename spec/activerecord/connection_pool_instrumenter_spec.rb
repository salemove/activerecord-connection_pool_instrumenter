# frozen_string_literal: true

require 'active_record'
require 'statsd'
require 'activerecord/connection_pool_instrumenter'

RSpec.describe Activerecord::ConnectionPoolInstrumenter do
  let(:prefix) { 'db.test.pool' }
  let(:connection_pool) { ActiveRecord::Base.connection_pool }
  let(:statsd) { instance_spy(Statsd) }

  before do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.sqlite3')
  end

  it 'sends DB connection pool metrics as gauges' do
    %i[size connections busy dead idle waiting].each do |metric|
      expect(statsd).to receive(:gauge).with("#{prefix}.#{metric}", instance_of(Integer))
    end

    task = described_class.instrument(
      connection_pool: connection_pool,
      statsd: statsd,
      prefix: prefix,
      execution_interval: 10.seconds
    )

    # Small sleep to allow timer thread to execute its code
    sleep 0.01

    task.shutdown
  end
end
