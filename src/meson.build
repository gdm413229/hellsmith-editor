hellsmith_editor_gtk3_sources = [
  'main.cpp',
  'hellsmith_editor_gtk3-window.cpp',
]

hellsmith_editor_gtk3_deps = [
  dependency('gtkmm-3.0', version: '>= 3.18'),
]

gnome = import('gnome')

hellsmith_editor_gtk3_sources += gnome.compile_resources('hellsmith_editor_gtk3-resources',
  'hellsmith_editor_gtk3.gresource.xml',
  c_name: 'hellsmith_editor_gtk3'
)

executable('hellsmith_editor_gtk3', hellsmith_editor_gtk3_sources,
  dependencies: hellsmith_editor_gtk3_deps,
  install: true,
)
