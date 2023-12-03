package com.example

import com.example.plugins.*
import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.http.*
import io.ktor.server.routing.*
import io.ktor.server.response.*

fun main() {
    embeddedServer(Netty, port = 30000, host = "0.0.0.0", module = Application::module).start(wait = true)
}

fun Application.module() {
    configureHTTP()
    configureRouting()
}
