# can pass column names stored as text with .data

    Code
      summarise2(dplyr::group_by(df, group), mean = mean(.data[[var]]))
    Output
      # A tibble: 2 x 2
      # Groups:   group [2]
        group  mean
        <chr> <dbl>
      1 A         7
      2 B        13

# can access column name with .data$col_name

    Code
      summarise2(dplyr::group_by(df, group), mean = mean(.data$value))
    Output
      # A tibble: 2 x 2
      # Groups:   group [2]
        group  mean
        <chr> <dbl>
      1 A         7
      2 B        13

