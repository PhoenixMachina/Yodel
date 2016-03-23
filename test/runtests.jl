using Base.Test
using Yodel

ydl = YodelEngine(string(dirname(Base.source_path()),"/routes.xml"))

r = getRouteWithController(ydl,"Home")
@test r.url == "home"
@test r.variables == []

r2 = getRoute(ydl,"news/761546/")
@test r2.controller == "News"
@test r2.variables == ["article_id"]

@test isRouteWithController(ydl,"nothingHere") == false
@test isRoute(ydl,"arandomurl") == false

@test getRouteWithController(ydl,"whatever").controller == "Default"
