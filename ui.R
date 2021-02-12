
navbarPage(
  title = 'Benvenuto',
  tabPanel('read.me', icon = icon("book-open"),  column(4,
                                                        
                                                        h3("Welcome to Interactive User Interface"),
                                                        
                                                        tags$b("Please wait/refresh for the map and the tabs to be downloaded.", style="color:red"),
                                                        
                                                        
                                                        h3("Map"),
                                                        
                                                        h4("Please select your criteria from the dropdown menu on the top right."),
                                                        
                                                        h3("Table"),
                                                        h4("Pivot table."),
                                                        
                                                       HTML("<h5> <b>Gender</b>  (male = 1, female = 
0), <b>Married</b> (married or cohabited = 1, otherwise = 0), <b>Employed</b>  (employed = 1, otherwise = 0), 
<b>Education</b>  (high school or higher = 1, otherwise = 0),
<b>Party</b>  (affiliation with Chinese communist party = 1, otherwise  = 0), 
<b>Household Registration (HR)</b>  (urban = 1, rural =  0), 
<b>Region</b>  (west, east, and center). 
<b>Age</b> , <b>Income</b> , <b>Net Worth</b>  (the value of financial
and non-financial assets minus liabilities), <b>NW-HE</b>  (net worth minus home equity),
and <b>Liquid Assets</b>  (cash and other easily cash-able assets) were coded as continues.</h5>"),
                                                       
                                                      
                                                       # h3("Data"),
                                                      #  h4("Download the filtered data."),
                                                        #h3("Reports Tab"), 
                                                        #h4(""),
                                                        
                                                        h3("Contact"), 
                                                        tags$a("Contact with the App Builder", href="https://seymakalay.github.io/unibg/"),
                                                        br(),
                                                        tags$a("See other Github repositories", href="https://github.com/seymakalay"),br(),br(),
                                                        
                                                        h6("Built with ",
                                                           img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
                                                           "by",
                                                           img(src = "https://rstudio.com/wp-content/uploads/2018/10/RStudio-Logo-Flat.png", height = "30px"),
                                                           ".")
                                                        # img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px"),
                                                        #".")
                                                      
                                                      
                                                        
  )), 
  
  
  tabPanel('Map',  icon = icon("map"),  leafletOutput("mymap2",width="100%", height = 800 )),
  
  tabPanel('Table', icon = icon("table"), rpivotTableOutput("pivot") ),
  
  
  
  
  
  
  
  #  navbarMenu("Reports",
  
  #add conditionalPanel here with respective tabs
  #             conditionalPanel(
  #               'input.navbar == "Supervised learning"||input.navbar == "Unsupervised learning"'      #||input.navbar == "Error Insight"'  #,
  #selectInput("variable", "Variable:", c("a","b","c"))
  
  
  #             ),  
  
  #            tabPanel("Supervised learning", column(8),#,
  
  #includeMarkdown("supervised.md")),   
  
  #                      tags$br()
  
  #             ),
  
  #             tabPanel("Unsupervised learning",column(8),#,
  
  #includeMarkdown("unsupervised.md")),
  
  
  #                     tags$br()
  #             )
  #,
  #tabPanel("Error Insight", tags$br()
  
  #)
  
  
  
  
  # ),
  
  #tabPanel("About",tags$br()), 
  
  #id for navbarPage           
  id="navbar" )


















