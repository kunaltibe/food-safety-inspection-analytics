import xml.etree.ElementTree as ET

def modify_xml_schema(xml_file_path):
    # Parse the XML schema file
    tree = ET.parse(xml_file_path)
    root = tree.getroot()

    # Define the changes for violation columns
    violation_changes = {}
    for i in range(25):
      violation_changes["Violation_Description___"+ str(i+1)] = {"length": "2000"}
      violation_changes["Violation_Points___" + str(i + 1)] = {"length": "10", "precision": "2", "talendType": "id_Float"}
      violation_changes["Violation_Detail___" + str(i + 1)] = {"length": "2000"}
      violation_changes["Violation_Memo___" + str(i + 1)] = {"length": "2000"}
        # Add other violation columns here if needed


    # Update the attributes for violation columns
    for column in root.findall('.//column'):
        column_name = column.get('label')
        if column_name in violation_changes:
            changes = violation_changes[column_name]
            for key, value in changes.items():
                column.set(key, value)

    # Save the modified XML schema to a new file
    modified_xml_file_path = xml_file_path.replace('.xml', '_modified.xml')
    tree.write(modified_xml_file_path)

    print(f"Modified XML schema saved to: {modified_xml_file_path}")

if __name__ == "__main__":
    xml_file_path = "/content/dallasstaging.xml"  # Update with your XML schema file path
    modify_xml_schema(xml_file_path)
