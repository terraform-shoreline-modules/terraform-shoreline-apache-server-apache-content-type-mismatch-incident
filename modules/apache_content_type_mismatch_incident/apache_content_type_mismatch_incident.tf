resource "shoreline_notebook" "apache_content_type_mismatch_incident" {
  name       = "apache_content_type_mismatch_incident"
  data       = file("${path.module}/data/apache_content_type_mismatch_incident.json")
  depends_on = [shoreline_action.invoke_replace_content_type]
}

resource "shoreline_file" "replace_content_type" {
  name             = "replace_content_type"
  input_file       = "${path.module}/data/replace_content_type.sh"
  md5              = filemd5("${path.module}/data/replace_content_type.sh")
  description      = "Set the correct Content-Type header in the Apache server configuration file."
  destination_path = "/agent/scripts/replace_content_type.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_replace_content_type" {
  name        = "invoke_replace_content_type"
  description = "Set the correct Content-Type header in the Apache server configuration file."
  command     = "`chmod +x /agent/scripts/replace_content_type.sh && /agent/scripts/replace_content_type.sh`"
  params      = ["PATH_TO_APACHE_CONF_FILE","CORRECT_CONTENT_TYPE"]
  file_deps   = ["replace_content_type"]
  enabled     = true
  depends_on  = [shoreline_file.replace_content_type]
}

