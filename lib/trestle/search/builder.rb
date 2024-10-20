module Trestle
  module Search
    module Builder
      def search(&block)
        admin.define_adapter_method(:search, &block)
      end

      def by_datetime(&block)
        admin.adapter.instance_eval do
          def by_datetime(from_param, to_param)
            raise "from_param: #{from_param}, to_param: #{to_param}"
            block.call(from_param, to_param)
          end
        end
      end

      def filter(&block)
        admin.define_adapter_method(:filter, &block)

        # admin.define_adapter_method(:params_to_time) do |from, to=nil|
        #   from = from.is_a?(String) && from.present? ? Time.zone.parse(from) : from
        #   to   = if to.is_a?(String) && to.present?
        #            to = Time.zone.parse(to)
        #
        #            # If the right bound is exactly the same as the left one, we add 1 day to the right
        #            # one by default.
        #            to.present? && to == from ? to + 1.day : to
        #          else
        #            to
        #          end
        #
        #   [from, to]
        # end
      end
    end
  end
end
