yamls = []
Dir.glob('**/*.yaml') { |c| yamls << c.sub(/\.yaml$/, '.json') }
yamls = yamls.sort
task :yaml => yamls

rule '.json' => '.yaml' do |yamltojson|
  sh "yaml2json #{yamltojson.source} >| #{yamltojson.name}"
end

task default: :yaml
