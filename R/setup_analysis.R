#' @title Set up analysis template for R script
#' @description Shiny interface to be used in RStudio to insert a data analysis
#' template into an empty Rscript document
#' @importFrom rstudioapi insertText
#' @importFrom miniUI miniPage gadgetTitleBar miniTabPanel miniTabstripPanel miniContentPanel
#' @importFrom shiny fillRow textInput textAreaInput checkboxGroupInput h1 br
#' reactiveValues observeEvent reactive stopApp paneViewer runGadget icon radioButtons
#' @importFrom glue glue

setup_analysis <- function(){

  ui <- miniPage(
    gadgetTitleBar("Set up analysis"),
    miniTabstripPanel(id = "panel",
      miniTabPanel("Script information", icon = icon("laptop-code"),
                   fillRow(
                     miniContentPanel(
                       h1("Script information"),
                       textInput("title", label = "Title", placeholder = "Analysis title"),
                       textInput("author", label = "Author", value = "Jose Alquicira-Hernandez"),
                       textInput("date", label = "Date", value = Sys.Date()),
                       textAreaInput("description", label =  "Description",
                                     placeholder = "Analysis description", height = "200px")

                     ),
                     miniContentPanel(
                       h1("Import libraries"),
                       checkboxGroupInput("libraries", "",
                                          choices =
                                            list("dsLib" ,"data.table", "purrr", "stringr", "furrr", "glue", "Seurat"),
                                          selected =
                                            list("dsLib", "data.table", "purrr")
                       ),
                       h1("Output"),
                       textInput("output_dir", label = "Output directory name"),

                     )
                   )


      ),
      miniTabPanel("HPC", icon = icon("network-wired"),
                   fillRow(miniContentPanel(),
                           miniContentPanel(
                             h1("HPC details"),
                             textInput("job", label = "Job name"),
                             br(),
                             textInput("ram", label = "RAM memory (GB)", value = 100),
                             br(),
                             textInput("workers", label = "Number of workers", value = 1),
                             br(),
                             radioButtons("queue", label = "Queue", choices = list("short", "long"), selected = "short")
                           ),
                           miniContentPanel()
                   )


      )
    )
  )


  server <- function(input, output, session){


    rv <- reactiveValues(prev_panel = NULL)

    observeEvent(input$panel, {
      rv$prev_panel <- c(rv$prev_panel, input$panel)
    })



    script_info <- reactive({
      glue('#   ____________________________________________________________________________
#   Script information                                                      ####

# title: {input$title}
# author: Jose Alquicira Hernandez
# date: {input$date}
# description: {input$description}

')
    })

    hpc_details <- reactive({
      glue('#   ____________________________________________________________________________
#   HPC details                                                             ####

# screen -S {input$job}
# qrsh -N {input$job} -l mem_requested={input$ram}G -pe smp {input$workers} -q {input$queue}.q
# conda activate r-4.1.0

')
    })


    analysis <- reactive({
      glue('#   ____________________________________________________________________________
#   Import libraries                                                        ####

{paste0("library(\\"", input$libraries, "\\")", collapse = "\n")}

#   ____________________________________________________________________________
#   Set output                                                              ####

output <- set_output("{input$date}", "{input$output_dir}")

#   ____________________________________________________________________________
#   Import data                                                             ####


#   ____________________________________________________________________________
#   Export data                                                             ####


#   ____________________________________________________________________________
#   Session info                                                            ####

print_session(here(output))

')

    })


    observeEvent(input$done, {

      if(any(rv$prev_panel == "HPC")){
        text <- glue(script_info(), hpc_details(), analysis(), .sep = "\n")
      }else{
        text <- glue(script_info(), analysis(), .sep = "\n")
      }
      insertText(text)
      stopApp(TRUE)
    })


  }

  viewer <- paneViewer(300)
  runGadget(ui, server, viewer = viewer)
}
