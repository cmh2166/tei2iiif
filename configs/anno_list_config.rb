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

to_field '@context', literal('http://www.shared-canvas.org/ns/context.json')
to_field '@type', literal('sc:AnnotationList')

# This should use a translation_map, but uncertain where to put locally
to_field '@id', lambda { |_record, accumulator, context|
  cc_id = context.settings.fetch('source_id')
  druid = YAML.load_file('translation_maps/argo-solr.yaml')[cc_id]
  page = extract_xml("/TEI/text/body/msDesc/msContents/msItem/@n", ns)
  accumulator << "http://dms-data.stanford.edu/data/manifests/Parker/#{druid}/list/#{page}.json"
}

compose 'resources', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field '@id', literal('UUID')
  to_field '@type', 'oa:Annotation'
  to_field 'motivation', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
  to_field 'on', literal("http://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/canvas/canvas-521#xywh=78,476,3527,174")
  compose 'resource', ->(rec, acc, _context) { acc << rec } do
    to_field '@id', literal('Generated ID')
    to_field '@type', literal('cnt:ContentAsText')
    to_field 'format', literal('text/plain')
    to_field 'chars', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
    to_field 'language', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
  end
end

compose 'resources', ->(rec, acc, _context) { acc << rec } do
  require 'traject_plus/macros/xml'
  extend TrajectPlus::Macros::Xml

  to_field '@id', literal('UUID')
  to_field '@type', 'oa:Annotation'
  to_field 'motivation', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
  to_field 'on', literal("http://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/canvas/canvas-521#xywh=78,476,3527,174")
  compose 'resource', ->(rec, acc, _context) { acc << rec } do
    to_field '@id', literal('Generated ID')
    to_field '@type', literal('cnt:ContentAsText')
    to_field 'format', literal('text/plain')
    to_field 'chars', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
    to_field 'language', extract_xml('/TEI/teiHeader/fileDesc/titleStmt/title', ns)
  end
end


#     "resources": [
#         {
#             "@id": "_:N9c970cc959cf4a90b242dc4a3072cb08",
#             "@type": "oa:Annotation",
#             "motivation": "sc:painting",
#             "resource": {
#                 "@id": "28b1a15c200d40ea3dcd63aa1d036826",
#                 "@type": "cnt:ContentAsText",
#                 "format": "text/plain",
#                 "chars": "ferde godes \u00e6ngel and acwealde on \u00e6lcu[m] huse \u00fe\u00e6s egyp {rhm: ang[e]l[u]s}",
#                 "language": "ang"
#             },
#             "on": "http://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/canvas/canvas-521#xywh=78,476,3527,174"
#         },
#         {
#             "@id": "_:Ncd607a7c4c3849e3a37ce2933cee1789",
#             "@type": "oa:Annotation",
#             "motivation": "sc:painting",
#             "resource": {
#                 "@id": "3eeaa4847c9823cf5deb6b8320045561",
#                 "@type": "cnt:ContentAsText",
#                 "format": "text/plain",
#                 "chars": "tiscan folces {: [real colon]} \u00fe[\u00e6t] fru[m]cennede cild. [et] \u00fe[\u00e6t] leofeste; [et] isra",
#                 "language": "ang"
#             },
#             "on": "http://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/canvas/canvas-521#xywh=78,651,3527,156"
#         },
#     ]
