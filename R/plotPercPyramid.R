
options(dplyr.summarise.inform = FALSE)

#' Population percentage pyramid graph
#'
#' @description Create a population percentage pyramid graph
#'
#' @import dplyr
#' @import ggplot2
#'
#' @param df Name of dataframe
#' @param age Age or age group. Write the parameter in quotation marks.
#' @param group Categorical grouping variable. Write the parameter in quotation marks.
#' @param perpop Percentage of population (in numerical value). Write the parameter in quotation marks.
#' @param labx X-axis label
#' @param laby Y-axis label
#' @param twocolors Two colors for the pyramid
#' @param rotation X-axis label rotation
#' @param n.breaks Number of breaks
#' @param value.labels Show values in the bars. Use TRUE to include the labels in the bars. Use FALSE to not include them.
#' @param position.value.labels Position of the values on the bars. Use "in" to display the labels inside the bars. Use "out" to display them outside the bars.
#' @param size.value.labels Font size of the values in the bars
#'
#' @return A graph of the pyramid of population percentage
#' @export
#'
#' @examples
#' library(readxl)
#' url <- "https://zenodo.org/record/8306939/files/popPER.xlsx?download=1"
#' destfile <- "popPER.xlsx"
#' curl::curl_download(url, destfile)
#' data <- read_excel(destfile)
#' data <- dplyr::filter(data, Year==2021)
#' library(dplyr)
#' data <- data |>
#' group_by(gAge, Sex) |>
#' summarise(Population = sum(Population)) |>
#' group_by(Sex) |>
#' mutate(percPopulation = round(Population/sum(Population)*100, 4)) |>
#' select(gAge, Sex, percPopulation) |>
#' arrange(Sex, gAge)
#' plotPercPyramid(df=data, age="gAge", group="Sex", perpop="percPopulation", value.labels=T)
#'
plotPercPyramid <- function(df, age, group, perpop, labx=perpop, laby=age,
                            twocolors=c("#1b9e77","#7570b3"),
                            rotation=0, n.breaks=20,
                            value.labels=TRUE, position.value.labels="in",
                            size.value.labels=3){

  if (position.value.labels=="in") {
    pvl = "inward"
  } else if (position.value.labels=="out"){
    pvl = "outward"
  } else {
    pvl = "inward"
  }

  df <- data.frame(cbind(df[,colnames(df)==age],
                         df[,colnames(df)==group],
                         df[,colnames(df)==perpop]))
  colnames(df) <- c("age", "group", "perpop")

  a <- unique(df$group)[1]
  b <- unique(df$group)[2]

  p <- df %>%
    mutate(perpop = ifelse(group == a, -perpop, perpop)) %>%
    ggplot(aes(x = age,
               y = perpop, fill = group)) +
    geom_col(position = "stack") +
    coord_flip() +
    scale_fill_manual(values = twocolors) +
    theme(legend.position = "bottom",
          legend.title = element_blank(),
          plot.caption = element_text(hjust = 0),
          axis.text.x = element_text(angle=rotation, vjust=0.5, hjust=0.5)) +
    scale_y_continuous(labels = function(x) abs(round(x,0)),
                       n.breaks = n.breaks) +
    labs(y = labx, x = laby)

  if (value.labels==FALSE) {
    p <- p
  } else if (value.labels==TRUE) {
    p <- p +
      geom_label(aes(label=round(abs(perpop),1)),
                 hjust=pvl, size=size.value.labels,
                 label.padding=unit(0.50, "lines"),
                 label.r = unit(0.00, "lines"),
                 fill="white")
  }

  return(p)
}
