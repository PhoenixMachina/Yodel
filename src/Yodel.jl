module Yodel

using LightXML # LightXML is required to parse the XML file

export YodelEngine,Route,getRoute,getRouteWithController,isRoute,isRouteWithController

type YodelEngine
  routes::Array # Routes of Yodel Object

  # The YodelEngine constructor parses the XML file
  function YodelEngine(xmlPath::ASCIIString)
    doc = parse_file(xmlPath)
    xroot = root(doc)
    routes = []
    xRoutes = get_elements_by_tagname(xroot,"route")
    for xRoute in xRoutes
      if typeof(attribute(xRoute,"variables")) == Void
        variables = []
      else
        variables = separateAttributes(attribute(xRoute,"variables"))
      end

      tempRoute = Route(attribute(xRoute,"url"),variables,attribute(xRoute,"controller"))

      push!(routes,tempRoute)
    end

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

function separateAttributes(attributesString) # Parses the variable attribute of the Route XML element to an array
  attributesString = string(attributesString)
  attributes = []

  attributesMatches = eachmatch(r",",attributesString)
  lastIndex = 0

  for att in attributesMatches
    push!(attributes,attributesString[lastIndex+1:att.offset])
    lastIndex = att.offset
  end

  push!(attributes,attributesString[lastIndex+1:end])
  return attributes
end

# Returns whether a function has a route for a specific URL or not
function isRoute(ydl::YodelEngine,url::ASCIIString)
  for route in ydl.routes
    if ismatch(Regex(route.url),url)
      return true
    end
  end
  return false
end

# Get a route that matches URL
function getRoute(ydl::YodelEngine,url::ASCIIString)
  for route in ydl.routes
    if ismatch(Regex(route.url),url)
      return route
    end
  end
  return Route("/",[],"Default")
end

# Get a route with a given controller
function isRouteWithController(ydl::YodelEngine,controller::ASCIIString)
  for route in ydl.routes
    if controller == route.controller
      return true
    end
  end
  return false
end
# Get a route with a given controller
function getRouteWithController(ydl::YodelEngine,controller::ASCIIString)
  for route in ydl.routes
    if controller == route.controller
      return route
    end
  end
  return Route("/",[],"Default")
end

# Extract variable from the url of a given route
function getVariable(url::ASCIIString,route::Route,variable::ASCIIString)
  #TODO
end


end # end of Yodel Module
