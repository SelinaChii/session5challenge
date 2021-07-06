server <- function(input, output) {
    setwd("/cloud/project/challenge")
    data <- reactive({
        req(input$filedata)
        read.csv(input$filedata$datapath)
    })
    
    
    output$table <- DT::renderDataTable({
        filtered <- data()
        
        if (!is.null(input$typeselected)) {
            filtered <- filtered %>% filter(Type.1 == input$typeselected)
        }
        if (!is.null(input$slider)) {
            filtered <- filtered %>% filter(Speed>=input$slider[1]& Speed <=input$slider[2])
        }
        if (!is.null(input$checkGroup)){
            filtered <- filtered %>% filter(Legendary== input$checkGroup)
        }
       
       datatable(filtered,options = list(scrollX = TRUE))
    })
    
    output$download <- downloadHandler(
        filename <- function(){
            return("pokemon.csv")
        },
        content = function(file){
            write.csv(data(),file)
        }
    )

}
