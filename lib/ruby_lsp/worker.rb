# typed: strict
# frozen_string_literal: true

module RubyLsp
  class Worker
    class ServerStoppedError < StandardError; end

    extend T::Sig

    sig { returns(IO) }
    attr_reader :input_write

    sig { returns(IO) }
    attr_reader :output_read

    sig { void }
    def initialize
      input_read, input_write = IO.pipe
      output_read, output_write = IO.pipe
      input_read.binmode
      output_write.binmode

      @input_write = T.let(input_write.binmode, IO)
      @output_read = T.let(output_read.binmode, IO)

      @pid = T.let(
        fork do
          Signal.trap("TERM") { raise ServerStoppedError }

          loop do
            item = input_read.gets("\r\n\r\n", chomp: true)
            next if item.nil?

            job, store = T.cast(Marshal.load(item), [Job, Store])
            request = job.request
            warn("processing #{request[:method]} in #{Process.pid}")

            result = if job.cancelled
              # We need to return nil to the client even if the request was cancelled
              Result.new(response: nil, notifications: [])
            else
              Executor.new(store).execute(request)
            end

            output_write.write("#{Marshal.dump([result, request])}\r\n\r\n")
          end
        rescue ServerStoppedError
          input_read.close
          output_write.close
        end,
        Integer,
      )

      input_read.close
      output_write.close
    end

    sig { void }
    def shutdown
      Process.kill(T.must(Signal.list["TERM"]), @pid)
      Process.wait(@pid)
      @input_write.close
      @output_read.close
    end
  end
end
