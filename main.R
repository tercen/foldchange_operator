library(tercen)
library(dplyr)

do.fc = function(df, reverse) {
  ratio = NaN
  
  if (reverse) {
    first = 2
    second = 1
  }
  else {
    first = 1
    second = 2
  }
  
  df_fc <- df %>%
    group_by(.x) %>%
    summarise(mean = mean(.y))
  
  result_fc = try({
    result <- df_fc$mean[first] / df_fc$mean[second]
    if (result < 1)
       result = -(1 / result)
    result
  }, silent = TRUE)
  
  if (!inherits(result_fc, 'try-error'))
    ratio = result_fc
  
  return(data.frame(
    .ri = df$.ri[1],
    .ci = df$.ci[1],
    FoldChange = ratio
  ))
}

ctx = tercenCtx()

if (!ctx$hasXAxis)
  stop("An x-axis factor is required.")
if (nrow(unique(ctx$select(ctx$xAxis))) != 2)
  stop("Two groups are required on x-axis")

ctx %>%
  select(.ci, .ri, .y, .x) %>%
  group_by(.ci, .ri) %>%
  do(do.fc(., as.logical(ctx$op.value('reverse')))) %>%
  ctx$addNamespace() %>%
  ctx$save()
