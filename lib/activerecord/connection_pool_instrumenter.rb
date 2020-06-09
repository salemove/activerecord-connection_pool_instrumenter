# frozen_string_literal: true

require 'activerecord/connection_pool_instrumenter/version'

module Activerecord
  module ConnectionPoolInstrumenter
    def self.instrument(
      statsd:,
      connection_pool: ActiveRecord::Base.connection_pool,
      prefix: 'db.connection_pool',
      execution_interval: 1.second,
      execution_timeout: 1.second
    )
      Concurrent::TimerTask.execute(
        execution_interval: execution_interval,
        timeout_interval: execution_timeout,
        run_now: true
      ) do
        # ActiveRecord::Base.connection_pool.stat returns
        # { size: 15, connections: 1, busy: 1, dead: 0, idle: 0, waiting: 0, checkout_timeout: 5 }
        connection_pool.stat.each_pair do |metric, value|
          statsd.gauge([prefix, metric].join('.'), value)
        end
      end
    end
  end
end
