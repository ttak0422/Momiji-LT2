#![feature(proc_macro_hygiene)]
#![feature(decl_macro)]

#[macro_use]
extern crate rocket;

use serde::{Deserialize, Serialize};
use rocket::request::Form;
use rocket_contrib::json::Json;

#[get("/")]
fn index() -> &'static str {
    "hello"
}

#[derive(FromForm)]
pub struct CalculationInput {
    a: i32,
    b: i32,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct CalculationResult {
    pub a: i32,
    pub b: i32,
    pub sum: i32,
    pub mul: i32,
}

#[get("/calc?<input..>")]
pub fn calculation(input: Form<CalculationInput>) -> Json<CalculationResult> {
    let a = input.a;
    let b = input.b;
    Json(
        CalculationResult {
            a: a,
            b: b,
            sum: a + b,
            mul: a * b,
        }
    )
}

fn main() {
    rocket::ignite()
        .mount("/api/", routes![index, calculation])
        .launch();
}