use actix_web::{get, web, App, HttpServer, Responder};
use std::env;

// unix:///var/run/docker.sock
#[get("/hello/{name}")]
async fn greet(name: web::Path<String>) -> impl Responder {
    format!("Hello {name}!")
}

#[actix_web::main] // or #[tokio::main]
async fn main() -> std::io::Result<()> {
    println!("Server Started");
    let port = env::var("PORT").unwrap_or("8080".to_string());
    println!("Port:{port}");
    HttpServer::new(|| App::new().service(greet).service(docker))
        .bind(format!("0.0.0.0:{port}"))?
        .run()
        .await
}
