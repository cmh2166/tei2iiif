XPATH                                                        | Mapping                                              |
------------------------------------------------------------------- | ---------------------------------------------------- |
`teiHeader`                                                         | Manifest: Create new manifest |
`teiHeader/fileDesc/titleStmt/title`                                | Manifest: "Corpus Christi College Cambridge / PARKER-ON-THE-WEB" |
`teiHeader/fileDesc/publicationStmt/p`                              | Manifest: "Electronic edition - 560catalogueAfter" |
`teiHeader/fileDesc/sourceDesc/p`                                   | Manifest: Citation (in XML) |
`teiHeader/encodingDesc/projectDesc/p`                              | Manifest: Digitization Note (1 step up?) |                      
`text/body/msDesc/msIdentifier/@xml:id`                             | Manifest: "CCC422", Manifest Identifier |
`text/body/msDesc/msIdentifier/country`                             | Manifest: "UK" |
`text/body/msDesc/msIdentifier/settlement`                          | Manifest: "Cambridge" |
`text/body/msDesc/msIdentifier/institution`                         | Manifest: "Corpus Christi College" |
`text/body/msDesc/msIdentifier/repository`                          | Manifest: "Parker Library" |
`text/body/msDesc/msIdentifier/idno`                                | Manifest: "77", Manifest Identifier too? |
`text/body/msDesc/msIdentifier/altIdentifier[@type="Elbing"]/idno`  | Manifest: "N. 17", Manifest Identifier too? |
`text/body/msDesc/msIdentifier/altIdentifier[@type="Stanley"]/idno` | Manifest: "Under B. 1", Manifest Identifier too? |
`text/body/msDesc/msIdentifier/altIdentifier[@type="TJames"]/idno`  | Manifest: "87", Manifest Identifier too?  |
`text/body/msDesc/head[@type="CCC"]`                                | Manifest: Title?                          |
`text/body/msDesc/head[@type="James"]`                              | Manifest: Alt Title?                      |
`text/body/msDesc/head[@type="Nasmith"]`                            | Manifest: Alt Title?                      |
`text/body/msDesc/additional/adminInfo/recordHist/p`                | Manifest?: msCheck, markup, markupCheck, remarks, text are starter options |
`text/body/msDesc/msContents/label`                                 | Manifest?: "Contents"                     |
`text/body/msDesc/msContents/msItem`                                | Canvas: Page (when a page number exists?) |
`text/body/msDesc/msContents/msItem/@locusEnd`                      | Last page of ab block                     |
`text/body/msDesc/msContents/msItem/@locusStart`                    | First page of ab block                    |
`text/body/msDesc/msContents/msItem/@n`                             | Canvas: Page Number                       |
`text/body/msDesc/msContents/msItem/ab`                             | anonymous block (not an annotation)       |
`text/body/msDesc/msContents/msItem/ab/@locus`                      | page number of anonymous block?           |
`text/body/msDesc/msContents/msItem/ab/@locusNew`                   | page number of anonymous block?           |
`text/body/msDesc/msContents/msItem/ab/decoNote`                    | Annotation: Note on decoration of ab      |
`text/body/msDesc/msContents/msItem/ab/decoNote/name`               | Annotation: Note on decoration of ab      |
`text/body/msDesc/msContents/msItem/ab/decoNote/name/@type`         | Annotation: Note on decoration of ab      |
`text/body/msDesc/msContents/msItem/ab/hi`                          | highlighted block                         |
`text/body/msDesc/msContents/msItem/ab/hi/@rend`                    | highlighted block rendering               |
`text/body/msDesc/msContents/msItem/ab/locus`                       | Location (page) of ab block               |
`text/body/msDesc/msContents/msItem/ab/name`                        | Name within an ab block                   |
`text/body/msDesc/msContents/msItem/ab/name/@type`                  | Type of name within an ab block           |
`text/body/msDesc/msContents/msItem/ab/q`                           | Quotation within an ab block              |
`text/body/msDesc/msContents/msItem/ab/ref`                         | Reference within an ab block              |
`text/body/msDesc/msContents/msItem/ab/ref/@target`                 | Referenced work within an ab block        |
`text/body/msDesc/msContents/msItem/ab/ref/@type`                   | Type of reference within an ab block      |
`text/body/msDesc/msContents/msItem/ab/ref/hi`                      | highlighted block                         |
`text/body/msDesc/msContents/msItem/ab/ref/hi/@rend`                | highlighted block rendering               |
`text/body/msDesc/msContents/msItem/explicit`                       | explicit of text                          |
`text/body/msDesc/msContents/msItem/explicit/@locus`                | location of explicit of text              |
`text/body/msDesc/msContents/msItem/explicit/@locusNew`             | location of explicit of text              |
`text/body/msDesc/msContents/msItem/head`                           | heading of text                           |
`text/body/msDesc/msContents/msItem/head/@type`                     | type of heading of text                   |
`text/body/msDesc/msContents/msItem/head/name`                      | name in heading of text                   |
`text/body/msDesc/msContents/msItem/head/name/@type`                | type of name in heading of text           |
`text/body/msDesc/msContents/msItem/head/title`                     | title in the heading of text              |
`text/body/msDesc/msContents/msItem/head/title/name`                | name in the title in the heading of text  |
`text/body/msDesc/msContents/msItem/head/title/name/@type`          | type of name in title in heading of text  |
`text/body/msDesc/msContents/msItem/incipit`                        | opening words of text                     |
`text/body/msDesc/msContents/msItem/incipit/@locusNew`              | location of opening words of text         |
`text/body/msDesc/msContents/msItem/incipit/name`                   | name in opening words of text             |
`text/body/msDesc/msContents/msItem/incipit/name/@type`             | type of name in opening words of text     |
`text/body/msDesc/msContents/msItem/rubric`                         | rubric                                    |
`text/body/msDesc/msContents/msItem/rubric/@locus`                  | location of rubric                        |
`text/body/msDesc/msContents/msItem/rubric/@locusNew`               | location of rubric                        |
`text/body/msDesc/msContents/msItem/rubric/name`                    | name in the rubric                        |
`text/body/msDesc/msContents/msItem/rubric/name/@type`              | type of name in the rubric                |
`text/body/msDesc/msContents/msItem/rubric/supplied`                | Annotation: supplied rubric               |
`text/body/msDesc/msContents/msItem/rubric/supplied/@agent`         | Annotation: who supplied the rubric       |
`text/body/msDesc/msContents/textLang`                              | Annotation: language of the text          |
`text/body/msDesc/msContents/textLang/@mainLang`                    | Annotation: language code of the text     |
`text/body/msDesc/p`                                                | paragraphs                                |
`text/body/msDesc/p/@function`                                      | Annotation: function of paragraph         |
`text/body/msDesc/p/@type`                                          | Annotation: type of function of paragraph |
`text/body/msDesc/p/collation`                                      | Annotation: how paragraphs are arranged   |
`text/body/msDesc/p/collation/num`                                  | Annotation: contains a number             |
`text/body/msDesc/p/decoNote`                                       | Annotation: paragraph decoration note     |
`text/body/msDesc/p/decoNote/date`                                  | Annotation: paragraph deco note date      |
`text/body/msDesc/p/decoNote/locus`                                 | Annotation: paragraph deco note location  |
`text/body/msDesc/p/extent`                                         | Annotation: paragraph page extent         |
`text/body/msDesc/p/foliation`                                      | Annotation: numbering system              |
`text/body/msDesc/p/handNote`                                       | Annotation: paragraph note on hand        |
`text/body/msDesc/p/label`                                          | paragraph label                           |
`text/body/msDesc/p/layout`                                         | Annotation: how paragraph is laid out     |
`text/body/msDesc/p/locus`                                          | location (page number) of paragraph       |
`text/body/msDesc/p/material`                                       | Annotation: kind of material              |
`text/body/msDesc/p/measureGrp`                                     | Annotation: dimensions of paragraph       |
`text/body/msDesc/p/measureGrp/@type`                               | type of dimensions                        |
`text/body/msDesc/p/measureGrp/height`                              | Annotation: height of the paragraph       |
`text/body/msDesc/p/measureGrp/height/@unit`                        | Annotation: height units                  |
`text/body/msDesc/p/measureGrp/width`                               | Annotation: width of the paragraph        |
`text/body/msDesc/p/measureGrp/width/@unit`                         | Annotation: width units                   |
`text/body/msDesc/p/origDate`                                       | origin date                               |
`text/body/msDesc/p/secFol`                                         | second folio                              |
