class PdfHandler

  def initialize(name)
    @name = name
    @message = "Hey #{name}, here's a Chuck Norris joke for you:"
    @file_timestamp = Time.now.strftime("%Y_%m_%d_%H_%M_%S_%L")
    @filename = "/tmp/JokeFor#{name}_#{@file_timestamp}.pdf"

    @doc = HexaPDF::Document.new
    @canvas = @doc.pages.add.canvas
    @canvas.font('Helvetica', size: 8)
  end

  def build_pdf
    joke = ChuckNorrisClient.chucks_no_joke

    @canvas.text(@message, at: [10, 800])

    y_value = 800

    joke["value"].split(".").each do |line|
      y_value -= 15
      @canvas.text("#{line}.", at: [10, y_value])
    end

    @doc.write(@filename, optimize: true)

    aws_client = AwsClient.new
    obj = aws_client.upload(@filename)

    { filename: @filename, url: obj.public_url }
  end

end
