require 'bundler/setup'
require 'traject'
require 'traject/json_writer'
require 'traject_plus/xml_reader'
require 'traject_plus/macros/xml'
require 'traject_plus/macros'
require 'traject_plus/extraction'
require 'traject_plus/indexer/step'
require 'nokogiri'
require 'byebug'
require 'yaml'
extend TrajectPlus::Macros
extend TrajectPlus::Macros::Xml
extend TrajectPlus::Extraction

settings do
  provide 'writer_class_name', 'JsonWriter'
  provide 'reader_class_name', 'TrajectPlus::XmlReader'
end

ns = {}

to_field '@context', literal('http://iiif.io/api/presentation/2/context.json')
to_field '@type', literal('sc:Manifest')
to_field 'label', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
to_field 'description', extract_xml('/TEI/teiHeader/encodingDesc/projectDesc/p', ns)

# This should use a translation_map, but uncertain where to put locally
to_field '@id', lambda { |_record, accumulator, context|
  cc_id = context.settings.fetch('source_id')
  druid = YAML.load_file('translation_maps/argo-solr.yaml')[cc_id]
  accumulator << "https://purl.stanford.edu/#{druid}/iiif/manifest"
}

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Title')
  to_field 'value', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Source')
  to_field 'value', extract_xml('/TEI/text/body/msDesc/msIdentifier/institution', ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Identifier')
  to_field 'value', extract_xml('/TEI/text/body/msDesc/msIdentifier/@xml:id', ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Identifier')
  to_field 'value', extract_xml('/TEI/text/body/msDesc/msIdentifier/idno', ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Identifier')
  to_field 'value', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='Elbing']/idno", ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Identifier')
  to_field 'value', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='Stanley']/idno", ns)
end

compose 'metadata', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field 'label', literal('Identifier')
  to_field 'value', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='TJames']/idno", ns)
end

compose 'sequences', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  require 'traject_plus/macros'
  require 'traject_plus/indexer/step'
  extend TrajectPlus::Macros::Xml
  extend TrajectPlus::Macros
  extend TrajectPlus::Indexer

  to_field '@id', extract_xml('/TEI/text/body/msDesc/msIdentifier/@xml:id', ns)
  to_field '@type', literal('sc:Sequence')
  to_field 'label', literal('TEI Page Order')
  compose 'canvases', ->(rec, acc, _context) { acc << rec } do
    require 'traject_plus/macros/xml'
    extend TrajectPlus::Macros::Xml

    to_field '@id', extract_xml("/TEI/text/body/msDesc/msContents/msItem/@n", ns)
    to_field '@type', literal('sc:Canvas')
    to_field 'label', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='TJames']/idno", ns)
  end
end
