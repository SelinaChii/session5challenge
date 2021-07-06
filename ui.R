ui <- fluidPage(
    titlePanel(p("Session 5 Challenge", style = "color:#3474A7")),
    sidebarLayout(
        sidebarPanel(
            img(
                src = "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/6ddff860886911.5a5cdfdc288b9.jpg",
                width = "200px", height = "70px"
            ),
            
            fileInput(
                inputId = "filedata",
                label = "Upload data. Choose csv file",
                accept = c(".csv")
            ),
            
            checkboxGroupInput("checkGroup", label = h3("Legendary"), 
                               choices = list("True" = "TRUE", "False" = "FALSE"),
                               selected = F),
            
            selectInput(
                inputId = "typeselected",
                label = "Select Type",
                choices = c("Grass" ,   "Fire"   ,  "Water"  ,  "Bug"    ,  "Normal" ,  "Poison" ,  "Electric", "Ground"  ,
                            "Fairy"  ,  "Fighting" ,"Psychic" , "Rock"  ,   "Ghost"  ,  "Ice"   ,   "Dragon"  , "Dark" ,   
                            "Steel"  ,  "Flying"  )
            ),
            sliderInput("slider",label="Pokemon Speed",min=1,max=180, value=c(50,100)
            ),
            
            
        ),
        
        mainPanel(
            DTOutput(outputId = "table"),
            downloadLink(outputId = "download", label="Download")
        )
    )
)
