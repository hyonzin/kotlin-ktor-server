package com.example.plugins

import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {
        get("/") {
            call.respondText("Hello World!")
        }

        get("/health") {
            call.respondText("UP")
        }

        get("/api/health") {
            call.respondText("UP")
        }

        get("/api/merong") {
            call.respondText("윤나 메덩")
        }
    }
}
