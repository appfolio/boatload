# frozen_string_literal: true

require 'boatload/worker'

module Boatload
  # A class for asynchronously enqueueing work to be processed in large batches.
  class AsyncBatchProcessor
    def initialize(&block)
      raise ArgumentError, 'You must give a block' unless block_given?

      @queue = Queue.new

      @worker = Worker.new(
        queue: @queue,
        &block
      )

      @thread_mutex = Mutex.new
      @worker_thread = nil
    end

    def push(*items)
      ensure_threads_running!

      items.each { |item| @queue.push([:item, item]) }
      nil
    end

    def process
      ensure_threads_running!

      @queue.push [:process, nil]
      nil
    end

    def shutdown
      ensure_threads_running!

      @queue.push [:shutdown, nil]
      @worker_thread&.join
      nil
    end

    private

    def ensure_threads_running!
      return if worker_thread_alive?

      @thread_mutex.synchronize do
        start_worker_thread!
      end
    end

    def worker_thread_alive?
      !!@worker_thread&.alive?
    end

    def start_worker_thread!
      return if worker_thread_alive?

      @worker_thread = Thread.new { @worker.run }
    end
  end
end