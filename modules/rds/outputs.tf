output "rds_endpoint" {
  value = aws_db_instance.poc_arc_db.endpoint
}
output "rds_db_name" {
  value = aws_db_instance.poc_arc_db.db_name
}
output "rds_engine" {
  value = aws_db_instance.poc_arc_db.engine
}
output "rds_username" {
  value = aws_db_instance.poc_arc_db.username
}
output "rds_db_identifier" {
  value = aws_db_instance.poc_arc_db.identifier
}