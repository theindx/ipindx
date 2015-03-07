csons = []
Dir.glob('**/*.cson') { |c| csons << c.sub(/\.cson$/, '.json') }
csons = csons.sort
task :cson => csons

rule '.json' => '.cson' do |csontojson|
  sh "cson2json #{csontojson.source} >| #{csontojson.name}"
end

task default: :cson
