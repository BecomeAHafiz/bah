unless Object.const_defined? :BindingOfCaller
  $:.unshift File.expand_path '../../lib', __FILE__
  require 'binding_of_caller'
  require 'binding_of_caller/version'
end

puts "Testing binding_of_caller version #{BindingOfCaller::VERSION}..."
puts "Ruby version: #{RUBY_VERSION}"

describe BindingOfCaller do
  describe "of_caller" do
    it "should fetch immediate caller's binding when 0 is passed" do
      o = Object.new
      def o.a
        var = 1
        binding.of_caller(0).eval('var')
      end

      o. a.should == 1
    end

    it "should fetch parent of caller's binding when 1 is passed" do
      o = Object.new
      def o.a
        var = 1
        b
      end

      def o.b
        binding.of_caller(1).eval('var')
      end

      o.a.should == 1
    end

    it "should modify locals in parent of caller's binding" do
      o = Object.new
      def o.a
        var = 1
        b
        var
      end

      def o.b
        binding.of_caller(1).eval('var = 20')
      end

      o.a.should == 20
    end

    it "should raise an exception when retrieving an out of band binding" do
      o = Object.new
      def o.a
        binding.of_caller(100)
      end

      lambda { o.a }.should.raise RuntimeError
    end
  end

  describe "callers" do
    before do
      @o = Object.new
    end

    it 'should return the first non-internal binding when using callers.first' do
      def @o.meth
        x = :a_local
        [binding.callers.first, binding.of_caller(0)]
      end

      b1, b2 = @o.meth
      b1.eval("x").should == :a_local
      b2.eval("x").should == :a_local
    end
  end

  describe "frame_count" do
    it 'frame_count should equal callers.count' do
      binding.frame_count.should == binding.callers.count
    end
  end

  describe "frame_type" do
    it 'should return the correct frame types' do
      o = Object.new

      # method frame
      def o.a
        b
      end

      # method frame
      def o.b
        # block frame
        proc do
          binding.callers
        end.call
      end
      caller_bindings = o.a
      caller_bindings[0].frame_type.should == :block
      caller_bindings[1].frame_type.should == :method
      caller_bindings[2].frame_type.should == :method
    end

  end
end

