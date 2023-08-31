###################################################################################################################################################### 
# Asegúrese de que los permisos para suplantar una cuenta de servicio no se concedan a nivel de proyecto
######################################################################################################################################################


# IAM Member ----------------------------------

resource "google_project_iam_member" "sa-user-on-project-test-serviceaccount" {
  project = "sha-devops-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:sha-devops-pbsb-event-fun-sa@sha-devops-id.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sa-user-on-project-test-group" {
  project = "sha-devops-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "group:sha-devops-cloud@gentera.com.mx"
}

resource "google_project_iam_member" "sa-user-on-project-test-user" {
  project = "sha-devops-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "user:dacarranza@gentera.com.mx"
}

## Binding -----------------------------------
resource "google_project_iam_binding" "sa-iam-binding-on-project-test-serviceaccount" {
  project = "sha-devops-id"
  role               = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:sha-devops-pbsb-event-fun-sa@sha-devops-id.iam.gserviceaccount.com",
     "user:dacarranza@gentera.com.mx", 
  ]
}

resource "google_project_iam_binding" "sa-iam-binding-on-project-test-group" {
  project = "sha-devops-id"
  role               = "roles/iam.serviceAccountUser"

  members = [
    "group:sha-devops-cloud@gentera.com.mx"
  ]
}

resource "google_project_iam_binding" "sa-iam-binding-on-project-test-user" {
  project = "sha-devops-id"
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:dacarranza@gentera.com.mx"
  ]
}



# # Evite el uso de roles básicos (primitivos) anteriores a IAM
# ######################################################################################################################################################
resource "google_project_iam_member" "sa-primitive-rol-on-project-test-serviceaccount" {
  project = "sha-devops-id"
  role    = "roles/owner"
  member  = "group:sha-devops-cloud@gentera.com.mx"
}

resource "google_project_iam_member" "sa-primitive-rol-on-project-test-group" {
  project = "sha-devops-id"
  role    = "roles/editor"
  member  = "serviceAccount:sha-devops-pbsb-event-fun-sa@sha-devops-id.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sa-primitive-rol-on-project-test-user" {
  project = "sha-devops-id"
  role    = "roles/viewer"
  member  = "user:dacarranza@gentera.com.mx"
}
