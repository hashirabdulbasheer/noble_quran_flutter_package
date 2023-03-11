#Script for converting one translation json file into another

import json
  
with open('input.json', encoding='utf-8') as f:
	input_data = json.load(f)

with open('hilali.json',encoding='utf-8') as f2:
	existing_data = json.load(f2)
  
# overwrite the existing translation file with translation from the new json
for line in input_data['quran']:
	sura=line["chapter"]-1
	aya=line["verse"]-1
	text=line["text"]
	existing_data["quran"]["sura"][sura]["aya"][aya]["text"]=text
	

with open("output.json", "w", encoding='utf-8') as outfile:
    json.dump(existing_data, outfile, ensure_ascii=False)    
    
  
# Closing file
f.close()
f2.close()
outfile.close()
