class ErrorData
  module Controls
    module ErrorData
      def self.example
        error_data = ::ErrorData.new
        error_data.class_name = Controls::Error.class_name
        error_data.message = Controls::Error.message

        first_line = ::ErrorData::Backtrace::Line.new
        first_line.line_number = Controls::Error::Backtrace::Lines::First.line_number
        first_line.filename = Controls::Error::Backtrace::Lines::First.filename
        first_line.method_name = Controls::Error::Backtrace::Lines::First.method_name

        second_line = ::ErrorData::Backtrace::Line.new
        second_line.line_number = Controls::Error::Backtrace::Lines::Second.line_number
        second_line.filename = Controls::Error::Backtrace::Lines::Second.filename
        second_line.method_name = Controls::Error::Backtrace::Lines::Second.method_name

        third_line = ::ErrorData::Backtrace::Line.new
        third_line.line_number = Controls::Error::Backtrace::Lines::Third.line_number
        third_line.filename = Controls::Error::Backtrace::Lines::Third.filename
        third_line.method_name = Controls::Error::Backtrace::Lines::Third.method_name

        error_data.backtrace << first_line
        error_data.backtrace << second_line
        error_data.backtrace << third_line

        error_data
      end

      def self.data
        data = {}

        data[:class_name] = Controls::Error.class_name
        data[:message] = Controls::Error.message

        backtrace = [
          {
            :line_number => Controls::Error::Backtrace::Lines::First.line_number,
            :filename => Controls::Error::Backtrace::Lines::First.filename,
            :method_name => Controls::Error::Backtrace::Lines::First.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Lines::Second.line_number,
            :filename => Controls::Error::Backtrace::Lines::Second.filename,
            :method_name => Controls::Error::Backtrace::Lines::Second.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Lines::Third.line_number,
            :filename => Controls::Error::Backtrace::Lines::Third.filename,
            :method_name => Controls::Error::Backtrace::Lines::Third.method_name
          }
        ]

        data[:backtrace] = backtrace

        data
      end

      module JSON
        def self.text
          ::JSON.generate(data)
        end

        def self.data
          {
            'className' => Controls::Error.class_name,
            'message' => Controls::Error.message,
            'backtrace' => Backtrace.data
          }
        end

        module Backtrace
          def self.data
            [
              Lines::First.data,
              Lines::Second.data,
              Lines::Third.data
            ]
          end

          module Lines
            module First
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Lines::First.filename,
                  'lineNumber' => Controls::Error::Backtrace::Lines::First.line_number,
                  'methodName' => Controls::Error::Backtrace::Lines::First.method_name
                }
              end
            end

            module Second
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Lines::Second.filename,
                  'lineNumber' => Controls::Error::Backtrace::Lines::Second.line_number,
                  'methodName' => Controls::Error::Backtrace::Lines::Second.method_name
                }
              end
            end

            module Third
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Lines::Third.filename,
                  'lineNumber' => Controls::Error::Backtrace::Lines::Third.line_number,
                  'methodName' => Controls::Error::Backtrace::Lines::Third.method_name
                }
              end
            end
          end
        end
      end
    end
  end
end
