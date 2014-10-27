require "mkmf"
# Make the MakeMakefile logger write file output to null.
module MakeMakefile::Logging
  @logfile = File::NULL
end

namespace :config do
  task :executable do
    fail "missing heroku executable from the PATH" unless find_executable "heroku"
  end

  desc "push the .env file to heroku config"
  task :push, [:env_file] => :executable do |t, args|
    args.with_defaults(env_file: ".env")

    File.readlines(args[:env_file]).map(&:strip).each do |value|
      sh "heroku config:set #{value}"
    end
  end

  desc "pull the config from heroku and write to .env file"
  task :pull, [:env_file] => :executable do |t, args|
    args.with_defaults(env_file: ".env")

    remote_config = `heroku config`
    remote_config or fail "could not fetch remote config"
    remote_config = remote_config.split("\n")
    remote_config.shift # remove the header

    # reformat the lines from
    #   XYZ:    abc
    # to
    #   XYZ=abc
    lines = remote_config.map { |cl|
      cl.split(":").map(&:strip).join("=")
    }

    File.open(args[:env_file], "w") do |f|
      f.puts lines
    end
  end
end

