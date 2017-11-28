require 'nokogiri'
require 'traject'

# For each TEI/XML file, generate Manifest
Dir.glob('descMD/split-xmls/description/*.xml') do |xml_file|
  out_id = File.basename(xml_file, '.xml')
  manifest_indexer = Traject::Indexer.new
  manifest_indexer.load_config_file('configs/manifest_config.rb')
  manifest_indexer.settings['output_file'] = 'manifests/' + out_id + '.json'
  manifest_indexer.settings['source_id'] = out_id
  manifest_indexer.process(File.open(xml_file))

  doc = Nokogiri::XML(File.open(xml_file))
  # Within TEI/XML file, for each msContents/msItem, generate Canvas, AnnoList
  doc.xpath('/TEI/text/body/msDesc/msContents/msItem').each do |canvas_node|
    page = out_id + '_' + canvas_node.xpath('./@n').text
    canvas_indexer = Traject::Indexer.new
    canvas_indexer.load_config_file('configs/canvas_config.rb')
    canvas_indexer.settings['output_file'] = 'canvases/' + page + '.json'
    canvas_indexer.settings['source_id'] = out_id
    canvas_indexer.process(canvas_node)

    annolist_indexer = Traject::Indexer.new
    annolist_indexer.load_config_file('configs/anno_list_config.rb')
    annolist_indexer.settings['output_file'] = 'annoLists/' + page + '.json'
    annolist_indexer.settings['source_id'] = out_id
    annolist_indexer.process(canvas_node)
  end
end
