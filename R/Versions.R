redmine_create_version <- function(project_id, name, description = NULL, status = "open" , ...) {

  #  fileTokens <- sapply(files, redmine_upload)
  #  stopifnot(length(fileTokens) == length(files))

  versionList <- list(
    #project_id = project_id,
    name = name,
    description = description,
    status = status
  )

  # remove NULL elements
  versionList <- removeNULL(versionList)

  # add extra arguments
  versionList <- modifyList(versionList, list(...))

  # create issue
  body <- list(version = versionList)

  issueRes <- redmine_post(paste0("/projects/",project_id,"/versions.json"), body = body, encode = "json")

  issueRes$content$version$id
}

redmine_list_versions = function (project_id) {
  redmine_get(paste0("/projects/",project_id,"/versions"), query = NULL)
}
