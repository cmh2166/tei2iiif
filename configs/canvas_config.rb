# frozen_string_literal: true

require 'bundler/setup'
require 'traject'
require 'traject/json_writer'
require 'traject_plus/xml_reader'
require 'traject_plus/macros/xml'
require 'traject_plus/extraction'
require 'nokogiri'
extend TrajectPlus::Macros::Xml

settings do
  provide 'writer_class_name', 'JsonWriter'
  provide 'reader_class_name', 'TrajectPlus::XmlReader'
end

ns = {}

to_field '@context', literal('http://iiif.io/api/presentation/2/context.json')
to_field '@id', literal("https://purl.stanford.edu/druid/iiif/manifest")
to_field '@type', literal('sc:Manifest')
to_field 'label', extract_xml("/TEI/teiHeader/fileDesc/titleStmt/title", ns)
to_field 'description', extract_xml("/TEI/teiHeader/encodingDesc/projectDesc/p", ns)
to_field 'id_elbing', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='Elbing']/idno", ns)
to_field 'id_stanley', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='Stanley']/idno", ns)
to_field 'id_TJames', extract_xml("/TEI/text/body/msDesc/msIdentifier/altIdentifier[@type='TJames']/idno", ns)

# metadata < [ { 'label': 'XYZ', 'Value': 'ABC' } ]
# to_field 'source', extract_xml("/TEI/text/body/msDesc/msIdentifier/institution", ns)
# to_field 'source', extract_xml("/TEI/text/body/msDesc/msIdentifier/repository", ns)
# to_field 'id', extract_xml("/TEI/text/body/msDesc/msIdentifier/@xml:id", ns)
# to_field 'id', extract_xml("/TEI/text/body/msDesc/msIdentifier/idno", ns)
# {
#   "@id": "https://purl.stanford.edu/tk780vf9050/iiif/canvas/image_1",
#   "@type": "sc:Canvas",
#   "label": "f. 254 r",
#   "height": 6030,
#   "width": 3950,
#   "images": [{
#     "@id": "https://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/imageanno/anno-521",
#     "@type": "oa:Annotation",
#     "motivation": "sc:painting",
#     "resource": {
#       "@id": "https://stacks.stanford.edu/image/iiif/fh878gz0315%2F198_254_R_TC_46/full/full/0/default.jpg",
#       "@type": "dctypes:Image",
#       "format": "image/jpeg",
#       "height": 6030,
#       "width": 3950,
#       "service": {
#         "@id": "https://stacks.stanford.edu/image/iiif/fh878gz0315%2F198_254_R_TC_46",
#         "@context": "http://iiif.io/api/image/2/context.json",
#         "profile": "http://iiif.io/api/image/2/level1.json"
#       }
#     },
#     "on": "https://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/canvas/canvas-521"
#   }],
#   "otherContent": [{
#     "@id": "https://dms-data.stanford.edu/data/manifests/Parker/fh878gz0315/list/text-f254r.json",
#     "@type": "sc:AnnotationList"
#   }]
# }
