require 'stringio'

def fake_io(inputs=[])
    fake_out = StringIO.new
    fake_in = StringIO.new
    inputs.each { |x| fake_in.puts(x) }
    fake_in.rewind
    $stdin = fake_in
    $stdout = fake_out
    yield
    $stdout = STDOUT
    $stdin = STDIN
    fake_out.rewind
    fake_out.readlines.map { |x| x.chomp }
end
