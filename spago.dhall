{ name = "learn-ps"
, dependencies = [ "console", "effect", "psci-support", "aff", "node-readline", "generics-rep" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
