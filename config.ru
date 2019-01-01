require './app'

use Rack::Reloader, 0
use Rack::ContentLength
run Russa.new