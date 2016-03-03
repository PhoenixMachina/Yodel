module Yodel

# using LightXML # LightXML is required to parse the XML file

export YodelEngine,Route,getRoute,getRouteWithController

type YodelEngine
  routes::Array # Routes of Yodel Object

  # The YodelEngine constructor parses the XML file
  function YodelEngine(xmlPath::ASCIIString)
    # Temporary routes
    route1 = Route("home",[],"Home")
    route2 = Route("news\/[a-zA-Z0-9 ]+\/",["article_id"],"news")
    routes = [route1,route2]

    new(routes)
  end
end

# Object Route which represent each route
type Route
  url::ASCIIString
  variables::Array
  controller::ASCIIString
  function Route(url::ASCIIString,variables::Array,controller::ASCIIString)
    new(url,variables,controller)
  end
end

# Get a route that matches URL
function getRoute(ydl::YodelEngine,url::ASCIIString)
  for route in ydl.routes
    if ismatch(Regex(route.url),url)
      return route
    end
  end
  return ""
end

# Get a route with a given controller
function getRouteWithController(ydl::YodelEngine,controller::ASCIIString)
  for route in ydl.routes
    if controller == route.controller
      return route
    end
  end
  return ""
end

# Extract variable from the url of a given route
function getVariable(url::ASCIIString,route::Route,variable::ASCIIString)
  #TODO
end

end # end of Yodel Module
